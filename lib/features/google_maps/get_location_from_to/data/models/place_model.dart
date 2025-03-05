import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latlong;

  PlaceModel({
    required this.id,
    required this.name,
    required this.latlong,
  });
}

List<PlaceModel> places = [
  PlaceModel(
      id: 1,
      name: 'Shawm House',
      latlong: LatLng(24.7095800976165, 46.68712941074665)),
  PlaceModel(
      id: 2,
      name: 'Gas Station',
      latlong: LatLng(24.698984687754564, 46.683090982370196)),
  PlaceModel(
      id: 3,
      name: 'Meeting Room',
      latlong: LatLng(24.714130865235, 46.6752961131039)),
];
