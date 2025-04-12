import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:location/location.dart';
import '../../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../../core/helper/google_maps/location_helper.dart';
import '../../../../../../core/helper/google_maps/geocoding_helper.dart';

part 'search_bar_state.dart';

@injectable
class SearchBarCubit extends Cubit<SearchBarState> {
  final LocationHelper _locationHelper = LocationHelper();
  final GeocodingHelper _geocodingHelper = GeocodingHelper();
  
  SearchBarCubit() : super(SearchBarInitial()) {
    loadCachedAddress();
    getUserName();
    getCurrentLocation();
  }

  String currentAddress = '';
  String userName = 'Hi, Guest';
  LocationData? currentLocation;

  Future<void> loadCachedAddress() async {
    try {
      emit(SearchBarLoading());
      final cachedAddress = SharedPrefUtils.getData('current_address');
      if (cachedAddress != null) {
        currentAddress = cachedAddress.toString();
        emit(SearchBarLoaded(currentAddress));
      } else {
        emit(SearchBarLoaded(''));
      }
    } catch (e) {
      emit(SearchBarError(e.toString()));
    }
  }

  Future<void> getUserName() async {
    try {
      final name = SharedPrefUtils.getData('userName');
      if (name != null) {
        userName = 'Hi, ${name.toString()}';
        emit(SearchBarLoaded(currentAddress)); // Emit to trigger UI update
      }
    } catch (e) {
      emit(SearchBarError(e.toString()));
    }
  }
  
  Future<void> getCurrentLocation() async {
    try {
      emit(SearchBarLoading());
      
      // Get current location
      final location = await _locationHelper.getCurrentLocation();
      if (location != null) {
        currentLocation = location;
        
        // Convert location to address
        final address = await _geocodingHelper.getAddressFromLocation(location);
        
        // Save address to cache
        await SharedPrefUtils.saveData(key: 'current_address', data: address);
        currentAddress = address;
        
        emit(SearchBarLoaded(address));
      } else {
        // If location is null, try to load from cache
        if (currentAddress.isEmpty) {
          loadCachedAddress();
        }
      }
    } catch (e) {
      emit(SearchBarError(e.toString()));
      // Try to load from cache if there's an error
      if (currentAddress.isEmpty) {
        loadCachedAddress();
      }
    }
  }
}
