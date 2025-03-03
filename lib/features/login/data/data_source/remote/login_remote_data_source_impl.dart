import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/core/network/api_manager.dart';
import 'package:manfaz/features/login/data/data_source/remote/base_login_remote_data_source.dart';
import 'package:manfaz/features/login/data/models/login_model.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/network/api_constant.dart';
import '../../../../../core/network/network_helper.dart';

@Injectable(as: BaseLoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements BaseLoginRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await apiManager.postData(
        ApiConstant.epLogin,
        body: {
          "email": email,
          "password": password,
        },
      );

      LoginModel loginModel = LoginModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: response.statusCode)) {
        await SharedPrefUtils.saveData(
            key: 'userName',
            data: loginModel.data?.name!.split(' ').first ?? 'null');
        return right(loginModel);
      } else {
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
          failureTitle: 'login.network_error'.tr(),
          errorMessage: 'login.check_internet'.tr(),
        ),
      );
    } catch (e) {
      return left(
        Failure(
          errorMessage: e.toString(),
          failureTitle: 'login.login_failed'.tr(),
        ),
      );
    }
  }
}
