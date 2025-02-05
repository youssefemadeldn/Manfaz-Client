import 'package:location/location.dart';

class LocationHelper {
  Location location = Location();

  // 1- enable LocationService
  enableServiceLocation() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
  }

  // 2- check permission
  Future<bool> checkPermission() async {
    var permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }
    if (permissionGranted == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  // 3- get user location
  getLocationStream(void Function(LocationData)? onData) {
    location.onLocationChanged.listen(onData);
  }
}
