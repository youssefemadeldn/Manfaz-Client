import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../data/models/get_user_profile_model.dart';

abstract class BaseProfileTabRepo {
  Future<Either<Failure, GetUserProfileModel>> getUserProfileById({required String id});
}
