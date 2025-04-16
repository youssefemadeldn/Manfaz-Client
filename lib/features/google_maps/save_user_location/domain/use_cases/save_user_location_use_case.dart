import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../../get_user_location/data/models/save_user_location_response_model.dart';
import '../repo/base_save_location_repo.dart';

@injectable
class SaveUserLocationUseCase {
  final BaseSaveLocationRepo baseSaveLocationRepo;
  
  SaveUserLocationUseCase(this.baseSaveLocationRepo);

  Future<Either<Failure, SaveUserLocationResponseModel>> call({
    required String address,
    required double latitude,
    required double longitude,
    required String type,
    String? name,
    String? notes,
  }) {
    return baseSaveLocationRepo.saveUserLocation(
      address: address,
      latitude: latitude,
      longitude: longitude,
      type: type,
      name: name,
      notes: notes,
    );
  }
}
