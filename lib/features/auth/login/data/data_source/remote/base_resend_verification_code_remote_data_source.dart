import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../../models/resend_verification_code_model.dart';

abstract class BaseResendVerificationCodeRemoteDataSource {
  Future<Either<Failure, ResendVerificationCodeModel>> resendVerificationCode({
    required String userId,
  });
}
