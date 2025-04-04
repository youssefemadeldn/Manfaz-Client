import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';
import '../../models/get_user_profile_model.dart';

abstract class BaseProfileTabRemoteDataSource {
  Future<Either<Failure, GetUserProfileModel>> getUserProfileById({required String id});
}
