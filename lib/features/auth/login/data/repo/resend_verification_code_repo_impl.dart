import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../data_source/remote/base_resend_verification_code_remote_data_source.dart';
import '../models/resend_verification_code_model.dart';
import '../../domain/repo/base_resend_verification_code_repo.dart';

@Injectable(as: BaseResendVerificationCodeRepo)
class ResendVerificationCodeRepoImpl implements BaseResendVerificationCodeRepo {
  final BaseResendVerificationCodeRemoteDataSource
      baseResendVerificationCodeRemoteDataSource;

  ResendVerificationCodeRepoImpl(
      this.baseResendVerificationCodeRemoteDataSource);

  @override
  Future<Either<Failure, ResendVerificationCodeModel>> resendVerificationCode({
    required String userId,
  }) async {
    return await baseResendVerificationCodeRemoteDataSource
        .resendVerificationCode(
      userId: userId,
    );
  }
}
