import 'package:dartz/dartz.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/register/data/models/register_model.dart';

abstract  class BaseRegisterRepo {
    Future<Either<Failure, RegisterModel>> register({
      required String name,
      required String email,
      required String password,
      required String phone,
      required String role,
    });
  }