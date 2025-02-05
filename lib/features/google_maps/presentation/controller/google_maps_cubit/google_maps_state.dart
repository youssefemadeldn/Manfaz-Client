part of 'google_maps_cubit.dart';

@immutable
sealed class GoogleMapsState {}

final class GoogleMapsInitialState extends GoogleMapsState {}

final class GoogleMapsNewMarkerState extends GoogleMapsState {}
