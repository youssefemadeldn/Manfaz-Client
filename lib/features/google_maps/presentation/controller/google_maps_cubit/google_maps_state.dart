part of 'google_maps_cubit.dart';

@immutable
abstract class GoogleMapsState {}

class GoogleMapsInitialState extends GoogleMapsState {}

class GoogleMapsLoadingState extends GoogleMapsState {}

class GoogleMapsSuccessState extends GoogleMapsState {}

class GoogleMapsErrorState extends GoogleMapsState {
  final String error;
  GoogleMapsErrorState(this.error);
}

class GoogleMapsNewMarkerState extends GoogleMapsState {}
