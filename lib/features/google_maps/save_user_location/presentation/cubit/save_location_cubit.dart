import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/save_user_location_use_case.dart';
import 'save_location_state.dart';

@injectable
class SaveLocationCubit extends Cubit<SaveLocationState> {
  final SaveUserLocationUseCase saveUserLocationUseCase;

  SaveLocationCubit(this.saveUserLocationUseCase) : super(SaveLocationInitial());

  String selectedLocationType = 'Home'; // Default type
  String? locationName;
  String? extraDetails;
  bool saveForLaterUse = true;

  void changeLocationType(String type) {
    selectedLocationType = type;
    emit(LocationTypeChanged(type));
  }

  void setLocationName(String? name) {
    locationName = name;
  }

  void setExtraDetails(String? details) {
    extraDetails = details;
  }

  void toggleSaveForLaterUse(bool value) {
    saveForLaterUse = value;
  }

  Future<void> saveUserLocation({
    required String address,
    required double latitude,
    required double longitude,
  }) async {
    emit(SaveLocationLoading());

    // Only save if user has opted to save for later use
    if (!saveForLaterUse) {
      emit(SaveLocationInitial());
      return;
    }

    final result = await saveUserLocationUseCase(
      address: address,
      latitude: latitude,
      longitude: longitude,
      type: selectedLocationType,
      name: locationName,
      notes: extraDetails,
    );

    result.fold(
      (failure) => emit(SaveLocationError(failure.errorMessage)),
      (success) => emit(SaveLocationSuccess(success)),
    );
  }
}
