import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../../models/get_user_locations_response_model.dart';

abstract class BaseUserLocationsRemoteDataSource {
  Future<Either<Failure, GetUserLocationsResponseModel>> getUserLocations({
    required String userId,
  });
}
