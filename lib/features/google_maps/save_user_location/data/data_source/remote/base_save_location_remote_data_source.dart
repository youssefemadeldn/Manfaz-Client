import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../get_user_location/data/models/save_user_location_response_model.dart';

abstract class BaseSaveLocationRemoteDataSource {
  Future<Either<Failure, SaveUserLocationResponseModel>> saveUserLocation({
    required String address,
    required double latitude,
    required double longitude,
    required String type,
    String? name,
    String? notes,
  });
}
