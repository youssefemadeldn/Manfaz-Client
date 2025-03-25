part of 'delivery_order_location_picker_cubit.dart';

abstract class DeliveryOrderLocationPickerState {}

class LocationInitial extends DeliveryOrderLocationPickerState {}

class LocationLoading extends DeliveryOrderLocationPickerState {}

class LocationSelected extends DeliveryOrderLocationPickerState {
  final LatLng position;
  final String address;

  LocationSelected(this.position, this.address);
}

class LocationError extends DeliveryOrderLocationPickerState {
  final String message;

  LocationError(this.message);
}