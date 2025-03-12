part of 'service_order_location_picker_cubit.dart';

@immutable
abstract class ServiceOrderLocationPickerState {}

class ServiceOrderLocationPickerInitialState
    extends ServiceOrderLocationPickerState {}

class ServiceOrderLocationPickerLoadingState
    extends ServiceOrderLocationPickerState {}

class ServiceOrderLocationPickerSuccessState
    extends ServiceOrderLocationPickerState {}

class ServiceOrderLocationPickerErrorState
    extends ServiceOrderLocationPickerState {
  final String error;
  ServiceOrderLocationPickerErrorState(this.error);
}

class NewMarkerState extends ServiceOrderLocationPickerState {}
