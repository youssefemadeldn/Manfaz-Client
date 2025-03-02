import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:manfaz/core/helper/google_maps/location_helper.dart';
import 'package:geocoding/geocoding.dart';
import 'package:meta/meta.dart';

part 'google_maps_state.dart';

class GoogleMapsCubit extends Cubit<GoogleMapsState> {
  late CameraPosition initialCameraPosition;
  GoogleMapController? cubitController;
  late LocationHelper locationHelper;
  late LocationData locationData;
  PermissionStatus permissionGranted = PermissionStatus.granted;
  String currentAddress = '';

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  Set<Polygon> polygons = {};

  GoogleMapsCubit() : super(GoogleMapsInitialState()) {
    init();
  }

  void init() {
    locationHelper = LocationHelper();
    initialCameraPosition = CameraPosition(
      target: LatLng(24.72087070791564, 46.67037450156113),
      zoom: 13,
    );
  }

  Future<void> getUserLocation() async {
    // emit(GoogleMapsLoadingState());
    try {
      locationData = await locationHelper.getCurrentLocation() ??
          LocationData.fromMap(
              {'latitude': 24.72087070791564, 'longitude': 46.67037450156113});
      if (locationData != null) {
        // Update camera position
        final newPosition = setNewCameraPosition(locationData);
        await cubitController?.animateCamera(
          CameraUpdate.newCameraPosition(newPosition),
        );

        // Get address from coordinates
        await getAddressFromLatLng(locationData);

        // Set marker at user's location
        setMarker(locationData);
        emit(GoogleMapsSuccessState());
      } else {
        emit(GoogleMapsErrorState('Could not get location'));
      }
    } catch (e) {
      emit(GoogleMapsErrorState(e.toString()));
    }
  }

  Future<void> getAddressFromLatLng(LocationData location) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        location.latitude!,
        location.longitude!,
      );

      if (placeMarks.isNotEmpty) {
        Placemark place = placeMarks[0];
        currentAddress =
            '${place.street}, ${place.subLocality}, ${place.locality}';
        if (currentAddress.trim().isEmpty) {
          currentAddress =
              '${place.locality}, ${place.administrativeArea}, ${place.country}';
        }
      }
    } catch (e) {
      currentAddress = e.toString();
    }
  }

  void initMapStyle(BuildContext context) async {
    // Load map style String from assets
    var nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/night_map_style.json');

    // Set map style
    cubitController!.setMapStyle(nightMapStyle);
  }

  CameraPosition setNewCameraPosition(LocationData currentLocation) {
    return CameraPosition(
      target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
      zoom: 15,
    );
  }

  void setMarker(LocationData currentLocation) {
    markers.clear(); // Clear existing markers
    var myLocationMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      markerId: MarkerId('current_location'),
      position: LatLng(currentLocation.latitude!, currentLocation.longitude!),
      infoWindow: InfoWindow(
        title: 'Your Location',
        snippet: currentAddress,
      ),
    );
    markers.add(myLocationMarker);
    emit(GoogleMapsNewMarkerState());
  }
}
