import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../data/models/get_user_locations_response_model.dart';

abstract class BaseUserLocationsRepo {
  Future<Either<Failure, GetUserLocationsResponseModel>> getUserLocations({
    required String userId,
  });
}
