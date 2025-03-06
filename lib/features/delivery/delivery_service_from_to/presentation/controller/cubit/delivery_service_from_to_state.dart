part of 'delivery_service_from_to_cubit.dart';

@immutable
sealed class DeliveryServiceFromToState {}

final class DeliveryServiceFromToInitial extends DeliveryServiceFromToState {}

final class DeliveryServiceFromToLocationSelected extends DeliveryServiceFromToState {
  final String address;
  final double? latitude;
  final double? longitude;
  final double? deliveryCost;
  final double? distanceInKm;

  DeliveryServiceFromToLocationSelected({
    required this.address,
    this.latitude,
    this.longitude,
    this.deliveryCost,
    this.distanceInKm,
  });
}

final class DeliveryServiceFromToLoading extends DeliveryServiceFromToState {}
