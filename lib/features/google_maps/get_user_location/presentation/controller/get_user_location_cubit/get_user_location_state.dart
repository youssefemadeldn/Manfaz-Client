part of 'get_user_location_cubit.dart';

@immutable
abstract class GetUserLocationState {}

class GetUserLocationInitialState extends GetUserLocationState {}

class GetUserLocationLoadingState extends GetUserLocationState {}

class GetUserLocationSuccessState extends GetUserLocationState {}

class GetUserLocationErrorState extends GetUserLocationState {
  final String error;
  GetUserLocationErrorState(this.error);
}

class NewMarkerState extends GetUserLocationState {}
