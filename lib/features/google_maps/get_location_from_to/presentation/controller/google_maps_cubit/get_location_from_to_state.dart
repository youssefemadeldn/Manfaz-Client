part of 'get_location_from_to_cubit.dart';

@immutable
abstract class GetLocationFromToState {}

class GetLocationFromToInitialState extends GetLocationFromToState {}

class GoogleMapsLoadingState extends GetLocationFromToState {}

class GetLocationFromToSuccessState extends GetLocationFromToState {}

class GetLocationFromToErrorState extends GetLocationFromToState {
  final String error;
  GetLocationFromToErrorState(this.error);
}

class GoogleMapsNewMarkerState extends GetLocationFromToState {}
