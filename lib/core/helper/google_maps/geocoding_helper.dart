import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';

class GeocodingHelper {
  Future<String> getAddressFromLocation(LocationData location) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        location.latitude!,
        location.longitude!,
      );

      if (placeMarks.isNotEmpty) {
        Placemark place = placeMarks[0];
        String address = '${place.street}, ${place.subLocality}, ${place.locality}';
        if (address.trim().isEmpty) {
          address = '${place.locality}, ${place.administrativeArea}, ${place.country}';
        }
        return address;
      }
      return 'Unable to get address';
    } catch (e) {
      return 'Unable to get address';
    }
  }
}
