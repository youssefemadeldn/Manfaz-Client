import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../../core/helper/google_maps/geocoding_helper.dart';
import '../../../../../../core/helper/google_maps/location_helper.dart';

part 'delivery_order_location_picker_state.dart';

@injectable
class DeliveryOrderLocationPickerCubit extends Cubit<DeliveryOrderLocationPickerState> {   late CameraPosition initialCameraPosition;
  GoogleMapController? cubitController;
  late LocationHelper locationHelper;
  late GeocodingHelper geocodingHelper;
  late LocationData locationData;
  PermissionStatus permissionGranted = PermissionStatus.granted;
  String currentAddress = '';
  static const String apiKey =
      'AIzaSyALEA-N5NgRqQEIRQUJwMRoUy0i-UM0rc8'; // Replace with your API key

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  Set<Polygon> polygons = {};

  DeliveryOrderLocationPickerCubit()
      : super(DeliveryOrderLocationPickerInitialState()) {
    init();
  }

  void init() {
    locationHelper = LocationHelper();
    geocodingHelper = GeocodingHelper();
    initialCameraPosition = CameraPosition(
      target: LatLng(24.72087070791564, 46.67037450156113),
      zoom: 13,
    );
  }

  Future<void> getUserLocation() async {
    try {
      locationData = await locationHelper.getCurrentLocation() ??
          LocationData.fromMap(
              {'latitude': 24.72087070791564, 'longitude': 46.67037450156113});

      // Update camera position
      final newPosition = setNewCameraPosition(locationData);
      await cubitController?.animateCamera(
        CameraUpdate.newCameraPosition(newPosition),
      );

      // Get address from coordinates
      currentAddress =
          await geocodingHelper.getAddressFromLocation(locationData);

      // Set marker at user's location
      setMarker(locationData);
      emit(DeliveryOrderLocationPickerSuccessState());
    } catch (e) {
      emit(DeliveryOrderLocationPickerErrorState(e.toString()));
    }
  }

  Future<void> onMapTapped(LatLng position) async {
    try {
      // Create LocationData from tapped position
      locationData = LocationData.fromMap({
        'latitude': position.latitude,
        'longitude': position.longitude,
      });

      // Get address for tapped location
      currentAddress =
          await geocodingHelper.getAddressFromLocation(locationData);

      // Cache the current address
      await SharedPrefUtils.saveData(
          key: 'current_address', data: currentAddress);

      // Set marker at tapped location
      setMarker(locationData);
      emit(DeliveryOrderLocationPickerSuccessState());
    } catch (e) {
      emit(DeliveryOrderLocationPickerErrorState(e.toString()));
    }
  }

  Future<void> onPlaceSelected(Prediction place) async {
    try {
      if (place.lat != null && place.lng != null) {
        // Create LocationData from selected place
        locationData = LocationData.fromMap({
          'latitude': double.parse(place.lat!),
          'longitude': double.parse(place.lng!),
        });

        // Update camera position
        final newPosition = setNewCameraPosition(locationData);
        await cubitController?.animateCamera(
          CameraUpdate.newCameraPosition(newPosition),
        );

        // Update address
        currentAddress = place.description ?? '';

        // Cache the current address
        await SharedPrefUtils.saveData(
            key: 'current_address', data: currentAddress);

        // Set marker at selected location
        setMarker(locationData);
        emit(DeliveryOrderLocationPickerSuccessState());
      }
    } catch (e) {
      emit(DeliveryOrderLocationPickerErrorState(e.toString()));
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
        title: 'Selected Location',
        snippet: currentAddress,
      ),
    );
    markers.add(myLocationMarker);
    emit(NewMarkerState());
  }
}
