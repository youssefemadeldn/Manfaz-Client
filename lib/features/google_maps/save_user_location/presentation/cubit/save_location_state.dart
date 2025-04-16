import 'package:equatable/equatable.dart';

import '../../../get_user_location/data/models/save_user_location_response_model.dart';

abstract class SaveLocationState extends Equatable {
  const SaveLocationState();

  @override
  List<Object?> get props => [];
}

class SaveLocationInitial extends SaveLocationState {}

class SaveLocationLoading extends SaveLocationState {}

class SaveLocationSuccess extends SaveLocationState {
  final SaveUserLocationResponseModel saveUserLocationResponseModel;

  const SaveLocationSuccess(this.saveUserLocationResponseModel);

  @override
  List<Object?> get props => [saveUserLocationResponseModel];
}

class SaveLocationError extends SaveLocationState {
  final String message;

  const SaveLocationError(this.message);

  @override
  List<Object?> get props => [message];
}

class LocationTypeChanged extends SaveLocationState {
  final String selectedType;

  const LocationTypeChanged(this.selectedType);

  @override
  List<Object?> get props => [selectedType];
}
