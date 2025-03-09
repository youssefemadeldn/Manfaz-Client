import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/cache/shared_pref_utils.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/core/network/api_manager.dart';
import 'package:manfaz/features/auth/register/data/data_source/remote/base_register_remote_data_source.dart';
import 'package:manfaz/features/auth/register/data/models/register_model.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/network/api_constant.dart';
import '../../../../../../core/network/network_helper.dart';

@Injectable(as: BaseRegisterRemoteDataSource)
class RegisterRemoteDataSource implements BaseRegisterRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

  @override
  Future<Either<Failure, RegisterModel>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String role,
  }) async {
    try {
      var response = await apiManager.postData(ApiConstant.epSignUp, body: {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "role": role,
      });
      //
      RegisterModel registerModel = RegisterModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: response.statusCode)) {
        // Success Case:
        await Future.wait([
          SharedPrefUtils.saveData(
              key: 'verificationCode',
              data: registerModel.data?.verificationCode),
          SharedPrefUtils.saveData(key: 'userId', data: registerModel.data?.id),
        ]);
        return right(registerModel);
      } else {
        // Server Error Case:
        return left(ServerFailure(
            errorMessage: registerModel.message!,
            failureTitle: "register.registration_failed".tr()));
      }
    } on DioException {
      // Unexpected DioError (e.g., timeout, internet connection)
      return left(
        NetworkFailure(
          failureTitle: 'register.network_error'.tr(),
          errorMessage: 'check_internet'.tr(),
        ),
      );
    } catch (e) {
      // General unexpected error
      return left(
        ServerFailure(
          errorMessage: 'register.email_phone_in_use'.tr(),
          failureTitle: 'register.registration_failed'.tr(),
        ),
      );
    }
  }
}
