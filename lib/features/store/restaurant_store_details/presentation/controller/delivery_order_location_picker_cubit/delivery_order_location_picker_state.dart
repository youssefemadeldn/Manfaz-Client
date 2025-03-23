part of 'delivery_order_location_picker_cubit.dart';

@immutable
sealed class DeliveryOrderLocationPickerState {}

class DeliveryOrderLocationPickerInitialState
    extends DeliveryOrderLocationPickerState {}

class DeliveryOrderLocationPickerLoadingState
    extends DeliveryOrderLocationPickerState {}

class DeliveryOrderLocationPickerSuccessState
    extends DeliveryOrderLocationPickerState {}

class DeliveryOrderLocationPickerErrorState
    extends DeliveryOrderLocationPickerState {
  final String error;
  DeliveryOrderLocationPickerErrorState(this.error);
}

class NewMarkerState extends DeliveryOrderLocationPickerState {}