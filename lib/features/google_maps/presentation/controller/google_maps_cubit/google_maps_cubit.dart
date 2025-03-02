import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:manfaz/core/helper/google_maps/location_helper.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:meta/meta.dart';

part 'google_maps_state.dart';

class GoogleMapsCubit extends Cubit<GoogleMapsState> {
  late CameraPosition initialCameraPosition;
  GoogleMapController? cubitController;
  late LocationHelper locationHelper;
  PermissionStatus permissionGranted = PermissionStatus.granted;

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  Set<Polygon> polygons = {};

  GoogleMapsCubit() : super(GoogleMapsInitialState());

  void init() {
    locationHelper = LocationHelper();
    // updateLocation();
    // init marker
    // initMarkers();
    // init polyline
    // initPolyLines();
    // init polygon
    // initPolygon();
    // init CameraPosition
    // initialCameraPosition = CameraPosition(
    //   target: LatLng(24.72087070791564, 46.67037450156113),
    //   zoom: 13,
    // );
  }

  void initMapStyle(BuildContext context) async {
    // Load map style String from assets
    var nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/night_map_style.json');

    // Set map style
    cubitController!.setMapStyle(nightMapStyle);
  }

  void initPolyLines() {
    var polyline = Polyline(
      color: AppColors.primary,
      width: 5,
      startCap: Cap.roundCap,
      // patterns: [PatternItem.dot],
      geodesic: true,
      jointType: JointType.mitered,
      polylineId: PolylineId('1'),
      points: [
        LatLng(24.72062761222113, 46.66617189754714),
        LatLng(24.52985679639409, 46.35179487637471),
        LatLng(24.78825694440542, 46.62813543163688),
      ],
    );
    polylines.add(polyline);
  }

  CameraPosition setNewCameraPosition(LocationData currentLocation) {
    var newCameraPosition = CameraPosition(
      target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
      zoom: 13,
    );
    return newCameraPosition;
  }

  void setMarker(LocationData currentLocation) {
    var myLocationMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      markerId: MarkerId('1'),
      position: LatLng(currentLocation.latitude!, currentLocation.longitude!),
      infoWindow: InfoWindow(
        title: 'Title',
        snippet: 'body',
      ),
    );
    markers.add(myLocationMarker);
    emit(GoogleMapsNewMarkerState());
  }
}

// steps get user location
/*
  1- enable LocationService
  2- check permission
  3- get user location
  4- display marker
*/

  // initMarkers() {
  //   // var marker = Marker(
  //   //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  //   //   markerId: MarkerId('1'),
  //   //   position: LatLng(24.72087070791564, 46.67037450156113),
  //   //   infoWindow: InfoWindow(
  //   //     title: 'Title',
  //   //     snippet: 'body',
  //   //   ),
  //   // );
  //   // markers.add(marker);
  // }


  // void initPolygon() {
  //   var polygon = Polygon(
  //     fillColor: AppColors.primary.withAlpha(100),
  //     polygonId: PolygonId('1'),
  //     points: [
  //       LatLng(24.72062761222113, 46.66617189754714),
  //       LatLng(24.52985679639409, 46.35179487637471),
  //       LatLng(24.79090191618876, 46.43568179796102),
  //     ],
  //     strokeWidth: 5,
  //     strokeColor: AppColors.primary,
  //   );
  //   polygons.add(polygon);
  // }
