import 'package:dartz/dartz.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/login/data/models/login_model.dart';

abstract class BaseLoginRepo {
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  });
}
