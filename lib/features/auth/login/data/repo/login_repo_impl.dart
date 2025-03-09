import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/auth/login/data/data_source/remote/base_login_remote_data_source.dart';
import 'package:manfaz/features/auth/login/data/models/login_model.dart';
import 'package:manfaz/features/auth/login/domain/repo/base_login_repo.dart';

@Injectable(as: BaseLoginRepo)
class LoginRepoImpl implements BaseLoginRepo {
  final BaseLoginRemoteDataSource baseLoginRemoteDataSource;

  LoginRepoImpl(this.baseLoginRemoteDataSource);

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
    required String role,
  }) async {
    return await baseLoginRemoteDataSource.login(
      email: email,
      password: password,
      role: role,
    );
  }
}
