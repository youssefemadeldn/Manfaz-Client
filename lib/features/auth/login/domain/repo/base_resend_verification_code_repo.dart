import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../data/models/resend_verification_code_model.dart';

abstract class BaseResendVerificationCodeRepo {
  Future<Either<Failure, ResendVerificationCodeModel>> resendVerificationCode({
    required String userId,
  });
}
