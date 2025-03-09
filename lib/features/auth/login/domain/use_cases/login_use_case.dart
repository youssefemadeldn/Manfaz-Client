import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/auth/login/data/models/login_model.dart';
import 'package:manfaz/features/auth/login/domain/repo/base_login_repo.dart';

@injectable
class LoginUseCase {
  final BaseLoginRepo baseLoginRepo;

  LoginUseCase(this.baseLoginRepo);

  Future<Either<Failure, LoginModel>> call({
    required String email,
    required String password,
    required String role,
  }) async {
    return await baseLoginRepo.login(
      email: email,
      password: password,
      role: role,
    );
  }
}
