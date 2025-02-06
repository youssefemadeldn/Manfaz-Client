import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/login/data/models/login_model.dart';
import 'package:manfaz/features/login/domain/repo/base_login_repo.dart';

@injectable
class LoginUseCase {
  final BaseLoginRepo baseLoginRepo;

  LoginUseCase(this.baseLoginRepo);

  Future<Either<Failure, LoginModel>> call({
    required String email,
    required String password,
  }) async {
    return await baseLoginRepo.login(
      email: email,
      password: password,
    );
  }
}
