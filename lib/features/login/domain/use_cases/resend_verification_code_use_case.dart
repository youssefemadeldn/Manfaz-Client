import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/resend_verification_code_model.dart';
import '../repo/base_resend_verification_code_repo.dart';

@injectable
class ResendVerificationCodeUseCase {
  final BaseResendVerificationCodeRepo baseResendVerificationCodeRepo;

  ResendVerificationCodeUseCase(this.baseResendVerificationCodeRepo);

  Future<Either<Failure, ResendVerificationCodeModel>> call({
    required String userId,
  }) async {
    return await baseResendVerificationCodeRepo.resendVerificationCode(
      userId: userId,
    );
  }
}
