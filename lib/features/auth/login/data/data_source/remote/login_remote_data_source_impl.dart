import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/core/network/api_manager.dart';
import 'package:manfaz/features/auth/login/data/data_source/remote/base_login_remote_data_source.dart';
import 'package:manfaz/features/auth/login/data/models/login_model.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/network/api_constant.dart';
import '../../../../../../core/network/network_helper.dart';

@Injectable(as: BaseLoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements BaseLoginRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      var response = await apiManager.postData(
        ApiConstant.epLogin,
        body: {
          "email": email,
          "password": password,
          "role": role,
        },
      );

      LoginModel loginModel = LoginModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: response.statusCode)) {
        Future.wait([
          SharedPrefUtils.saveData(key: 'userId', data: loginModel.data?.id),
          SharedPrefUtils.saveData(key: 'hasLoggedIn', data: true),
          SharedPrefUtils.saveData(
              key: 'userName',
              data: loginModel.data?.name!.split(' ').first ?? 'null'),
        ]);
        return right(loginModel);
      } else {
        log(loginModel.message!);
        return left(
          ServerFailure(
            errorMessage: loginModel.message!,
            failureTitle: 'login.login_failed'.tr(),
          ),
        );
      }
    } on DioException {
      return left(
        NetworkFailure(
          failureTitle: 'shared.network_error'.tr(),
          errorMessage: 'shared.check_internet'.tr(),
        ),
      );
    } catch (e) {
      log(e.toString());
      return left(
        Failure(
          failureTitle: 'login.login_failed'.tr(),
          errorMessage: 'shared.error_message'.tr(),
        ),
      );
    }
  }
}
