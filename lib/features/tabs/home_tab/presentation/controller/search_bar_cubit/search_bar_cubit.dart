import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:location/location.dart';
import '../../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../../core/helper/google_maps/location_helper.dart';
import '../../../../../../core/helper/google_maps/geocoding_helper.dart';
import '../../../../../../core/helper/date_formatter_helper.dart';
import '../../../../../../core/helper/easy_localization_helper.dart';
import '../../../data/models/get_user_locations_response_model.dart';
import '../../../domain/use_cases/get_user_locations_use_case.dart';

part 'search_bar_state.dart';

@injectable
class SearchBarCubit extends Cubit<SearchBarState> {
  final LocationHelper _locationHelper = LocationHelper();
  final GeocodingHelper _geocodingHelper = GeocodingHelper();
  final EasyLocalizationHelper _localizationHelper = EasyLocalizationHelper();
  final GetUserLocationsUseCase getUserLocationsUseCase;
  
  SearchBarCubit(this.getUserLocationsUseCase) : super(SearchBarInitial()) {
    loadCachedAddress();
    getUserName();
    checkAndGetLocation();
  }

  String currentAddress = '';
  String welcomeMessageWithUserName = 'Hi Guest';
  LocationData? currentLocation;
  List<Data>? userLocations;

  Future<void> loadCachedAddress() async {
    try {
      emit(SearchBarLoading());
      final cachedAddress = SharedPrefUtils.getData('current_address');
      if (cachedAddress != null) {
        currentAddress = cachedAddress.toString();
        emit(SearchBarLoaded(currentAddress));
        return;
      }
      emit(SearchBarLoaded(''));
    } catch (e) {
      emit(SearchBarError(e.toString()));
    }
  }

  Future<void> getUserName() async {
    try {
      // Get current locale
      final currentLocale = _localizationHelper.getCurrentLocale();
      
      // Get appropriate greeting based on time and locale
      final greeting = DateAndTimeHelper.getGreeting(currentLocale);
      
      // Get user name from cache
      final name = SharedPrefUtils.getData('userName');
      
      if (name != null) {
        // Format greeting with user name
        welcomeMessageWithUserName = '$greeting ${name.toString()}';
      } else {
        // Default greeting for guest
        welcomeMessageWithUserName = '$greeting Guest';
      }
      
      emit(SearchBarLoaded(currentAddress)); // Emit to trigger UI update
    } catch (e) {
      emit(SearchBarError(e.toString()));
    }
  }
  
  Future<void> checkAndGetLocation() async {
    try {
      // Check if we have a manually selected location
      final isManuallySelected = SharedPrefUtils.getData('is_manually_selected_location');
      
      // If we have a manually selected location, just load it from cache
      if (isManuallySelected != null && isManuallySelected == true) {
        await loadCachedAddress();
        
        // Get coordinates if available for future use
        final lat = SharedPrefUtils.getData('current_latitude');
        final lng = SharedPrefUtils.getData('current_longitude');
        
        if (lat != null && lng != null) {
          currentLocation = LocationData.fromMap({
            'latitude': double.parse(lat.toString()),
            'longitude': double.parse(lng.toString()),
          });
        }
      } else {
        // If no manually selected location, get current location
        await getCurrentLocation();
      }
    } catch (e) {
      emit(SearchBarError(e.toString()));
      // Try to load from cache if there's an error
      if (currentAddress.isEmpty) {
        loadCachedAddress();
      }
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
        await SharedPrefUtils.saveData(key: 'current_latitude', data: location.latitude.toString());
        await SharedPrefUtils.saveData(key: 'current_longitude', data: location.longitude.toString());
        
        // Set manually selected flag to false since this is automatic
        await SharedPrefUtils.saveData(key: 'is_manually_selected_location', data: false);
        
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
  
  // Call this method when returning from location selection screen
  Future<void> refreshAddressFromCache() async {
    await loadCachedAddress();
  }

  // Fetch user locations from the API
  Future<void> getUserLocations() async {
    try {
      emit(SearchBarLoading());
      
      // Get user ID from shared preferences
      final userId = SharedPrefUtils.getData('userId');
      
      if (userId != null) {
        final result = await getUserLocationsUseCase(userId: userId.toString());
        
        result.fold(
          (failure) {
            emit(SearchBarError(failure.errorMessage));
          },
          (response) {
            userLocations = response.data;
            emit(SearchBarLocationsLoaded(userLocations ?? []));
          }
        );
      } else {
        emit(SearchBarError('home.user_id_not_found'.tr()));
      }
    } catch (e) {
      emit(SearchBarError(e.toString()));
    }
  }
}
