import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:manfaz/core/helper/google_maps/geocoding_helper.dart';
import 'package:manfaz/core/helper/google_maps/location_helper.dart';
import 'package:manfaz/core/cache/shared_pref_utils.dart';
import 'package:meta/meta.dart';

part 'service_order_location_picker_state.dart';

@injectable
class ServiceOrderLocationPickerCubit
    extends Cubit<ServiceOrderLocationPickerState> {
  late CameraPosition initialCameraPosition;
  GoogleMapController? cubitController;
  late LocationHelper locationHelper;
  late GeocodingHelper geocodingHelper;
  late LocationData locationData;
  PermissionStatus permissionGranted = PermissionStatus.granted;
  String currentAddress = '';
  String extraDetails = '';
  LatLng? selectedLocation;
  static const String apiKey =
      'AIzaSyALEA-N5NgRqQEIRQUJwMRoUy0i-UM0rc8'; // Replace with your API key

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  Set<Polygon> polygons = {};

  ServiceOrderLocationPickerCubit()
      : super(ServiceOrderLocationPickerInitialState()) {
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

  void onExtraDetailsChanged(String value) {
    extraDetails = value;
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
      selectedLocation = LatLng(locationData.latitude!, locationData.longitude!);
      emit(ServiceOrderLocationPickerSuccessState());
    } catch (e) {
      emit(ServiceOrderLocationPickerErrorState(e.toString()));
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
      selectedLocation = position;
      emit(ServiceOrderLocationPickerSuccessState());
    } catch (e) {
      emit(ServiceOrderLocationPickerErrorState(e.toString()));
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

        // Get address for selected place
        currentAddress =
            await geocodingHelper.getAddressFromLocation(locationData);

        // Set marker at selected place
        setMarker(locationData);
        selectedLocation = LatLng(locationData.latitude!, locationData.longitude!);
        emit(ServiceOrderLocationPickerSuccessState());
      }
    } catch (e) {
      emit(ServiceOrderLocationPickerErrorState(e.toString()));
    }
  }

  Future<void> initMapStyle(BuildContext context) async {
    try {
      bool isDark = Theme.of(context).brightness == Brightness.dark;
      String style = await DefaultAssetBundle.of(context).loadString(
        isDark
            ? 'assets/map_styles/dark_map_style.json'
            : 'assets/map_styles/light_map_style.json',
      );
      await cubitController?.setMapStyle(style);
    } catch (e) {
      print('Error loading map style: $e');
    }
  }

  CameraPosition setNewCameraPosition(LocationData currentLocation) {
    return CameraPosition(
      target: LatLng(
        currentLocation.latitude!,
        currentLocation.longitude!,
      ),
      zoom: 15,
    );
  }

  void setMarker(LocationData currentLocation) {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(
          currentLocation.latitude!,
          currentLocation.longitude!,
        ),
      ),
    );
  }
}
