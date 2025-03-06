import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'delivery_service_from_to_state.dart';

@injectable
class DeliveryServiceFromToCubit extends Cubit<DeliveryServiceFromToState> {
  DeliveryServiceFromToCubit() : super(DeliveryServiceFromToInitial());

  String? fromAddress;
  String? toAddress;
  double? fromLat;
  double? fromLng;
  double? toLat;
  double? toLng;
  double? distanceInKm;
  double? deliveryCost;

  // Base pricing constants
  static const double BASE_PRICE = 20.0; // Base price in EGP
  static const double PRICE_PER_KM = 5.0; // Price per kilometer in EGP
  static const double MIN_PRICE = 30.0; // Minimum delivery price

  void updateFromLocation(String address, {double? lat, double? lng}) {
    fromAddress = address;
    fromLat = lat;
    fromLng = lng;
    _calculateDeliveryCost();
    emit(DeliveryServiceFromToLocationSelected(
      address: address,
      latitude: lat,
      longitude: lng,
      deliveryCost: deliveryCost,
      distanceInKm: distanceInKm,
    ));
  }

  void updateToLocation(String address, {double? lat, double? lng}) {
    toAddress = address;
    toLat = lat;
    toLng = lng;
    _calculateDeliveryCost();
    emit(DeliveryServiceFromToLocationSelected(
      address: address,
      latitude: lat,
      longitude: lng,
      deliveryCost: deliveryCost,
      distanceInKm: distanceInKm,
    ));
  }

  void _calculateDeliveryCost() {
    if (fromLat != null && fromLng != null && toLat != null && toLng != null) {
      // Calculate distance using Haversine formula
      distanceInKm = _calculateDistance(
        LatLng(fromLat!, fromLng!),
        LatLng(toLat!, toLng!),
      );
      
      // Calculate delivery cost
      deliveryCost = BASE_PRICE + (distanceInKm! * PRICE_PER_KM);
      
      // Ensure minimum price
      if (deliveryCost! < MIN_PRICE) {
        deliveryCost = MIN_PRICE;
      }
    } else {
      distanceInKm = null;
      deliveryCost = null;
    }
  }

  double _calculateDistance(LatLng from, LatLng to) {
    const double earthRadius = 6371; // Earth's radius in kilometers
    
    // Convert latitude and longitude to radians
    final double lat1 = _toRadians(from.latitude);
    final double lon1 = _toRadians(from.longitude);
    final double lat2 = _toRadians(to.latitude);
    final double lon2 = _toRadians(to.longitude);
    
    // Haversine formula
    final double dLat = lat2 - lat1;
    final double dLon = lon2 - lon1;
    final double a = _square(sin(dLat / 2)) +
        cos(lat1) * cos(lat2) * _square(sin(dLon / 2));
    final double c = 2 * asin(sqrt(a));
    
    // Calculate distance
    return earthRadius * c;
  }

  double _toRadians(double degree) {
    return degree * (pi / 180);
  }

  double _square(double value) {
    return value * value;
  }

  void clearLocations() {
    fromAddress = null;
    toAddress = null;
    fromLat = null;
    fromLng = null;
    toLat = null;
    toLng = null;
    distanceInKm = null;
    deliveryCost = null;
    emit(DeliveryServiceFromToInitial());
  }
}
