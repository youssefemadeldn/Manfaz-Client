import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:location/location.dart';
import 'package:manfaz/core/helper/google_maps/geocoding_helper.dart';

part 'delivery_order_location_picker_state.dart';

class DeliveryOrderLocationPickerCubit extends Cubit<DeliveryOrderLocationPickerState> {
  DeliveryOrderLocationPickerCubit() : super(LocationInitial());

  // Controllers
  final TextEditingController searchController = TextEditingController();
  final TextEditingController extraDetailsController = TextEditingController();

  // Map state
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  bool saveLocation = false;
  LatLng initialPosition = const LatLng(24.7136, 46.6753); // Riyadh
  LatLng? currentPosition;
  final GeocodingHelper _geocodingHelper = GeocodingHelper();

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    getUserLocation();
  }

  void onCameraMove(CameraPosition position) {
    currentPosition = position.target;
  }

  void onCameraIdle() async {
    if (currentPosition != null) {
      emit(LocationLoading());
      // Get address from coordinates
      final address = await _getAddressFromLatLng(currentPosition!);
      emit(LocationSelected(currentPosition!, address));
    }
  }

  void onPlaceSelected(Prediction prediction) async {
    if (prediction.lat == null || prediction.lng == null) return;
    
    final position = LatLng(
      double.parse(prediction.lat!),
      double.parse(prediction.lng!),
    );
    
    // Move camera to selected location
    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(position, 15),
    );
  }

  void onExtraDetailsChanged(String value) {
    // Update state if needed
  }

  void onSaveLocationChanged(bool value) {
    saveLocation = value;
    emit(state); // Re-emit current state to trigger rebuild
  }

  Future<void> getUserLocation() async {
    emit(LocationLoading());
    
    final location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    try {
      // Check if location services are enabled
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          emit(LocationError('Location services are disabled'));
          return;
        }
      }

      // Check location permission
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          emit(LocationError('Location permission denied'));
          return;
        }
      }

      // Get location
      locationData = await location.getLocation();
      final position = LatLng(locationData.latitude!, locationData.longitude!);
      
      // Move camera to user location
      mapController.animateCamera(
        CameraUpdate.newLatLngZoom(position, 15),
      );

      // Get address
      final address = await _getAddressFromLatLng(position);
      emit(LocationSelected(position, address));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  Future<String> _getAddressFromLatLng(LatLng position) async {
    final locationData = LocationData.fromMap({
      'latitude': position.latitude,
      'longitude': position.longitude,
    });
    return await _geocodingHelper.getAddressFromLocation(locationData);
  }

  @override
  Future<void> close() {
    searchController.dispose();
    extraDetailsController.dispose();
    return super.close();
  }
}
