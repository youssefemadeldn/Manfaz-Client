import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/api_constant.dart';
import '../../../../../core/network/api_manager.dart';
import '../../../../../core/network/network_helper.dart';
import '../../models/resend_verification_code_model.dart';
import 'base_resend_verification_code_remote_data_source.dart';

@Injectable(as: BaseResendVerificationCodeRemoteDataSource)
class ResendVerificationCodeRemoteDataSourceImpl implements BaseResendVerificationCodeRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

  @override
  Future<Either<Failure, ResendVerificationCodeModel>> resendVerificationCode({
    required String userId,
  }) async {
    try {
      var response = await apiManager.postData(
        ApiConstant.epResendVerificationCode,
        body: {
          "id": userId,
        },
      );

      ResendVerificationCodeModel resendVerificationCodeModel = 
          ResendVerificationCodeModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: response.statusCode)) {
        return right(resendVerificationCodeModel);
      } else {
        return left(
          ServerFailure(
            failureTitle: 'Server Failure',
            errorMessage: resendVerificationCodeModel.message ?? 'Failed to resend verification code',
          ),
        );
      }
    } catch (e) {
      return left(
        ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: 'Failed to resend verification code',
        ),
      );
    }
  }
}
