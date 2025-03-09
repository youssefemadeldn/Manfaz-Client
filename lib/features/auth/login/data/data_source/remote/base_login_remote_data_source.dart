import 'package:dartz/dartz.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/auth/login/data/models/login_model.dart';

abstract class BaseLoginRemoteDataSource {
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
    required String role,
  });
}
