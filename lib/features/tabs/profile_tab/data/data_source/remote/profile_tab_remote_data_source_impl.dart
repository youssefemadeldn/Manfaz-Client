import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/core/helper/easy_localization_helper.dart';
import 'package:manfaz/core/network/api_constant.dart';
import 'package:manfaz/core/network/api_manager.dart';
import 'package:manfaz/core/network/network_helper.dart';
import 'package:manfaz/features/tabs/profile_tab/data/models/get_user_profile_model.dart';

import '../../../../../../core/di/di.dart';
import 'base_profile_tab_remote_data_source.dart';

@Injectable(as: BaseProfileTabRemoteDataSource)
class ProfileTabRemoteDataSourceImpl implements BaseProfileTabRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

  // Use provided language or default to 'en'
  final currentLanguage = EasyLocalizationHelper().getCurrentLocale();

  @override
  Future<Either<Failure, GetUserProfileModel>> getUserProfileById(
      {required String id}) async {
    try {
      // Make request with language parameter and id as query parameter
      var response = await apiManager.getData(
        "${ApiConstant.epGetUsers}/$id",
        queryParameters: {
          'lang': currentLanguage,
        },
      );

      GetUserProfileModel userProfileModel =
          GetUserProfileModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: userProfileModel.code)) {
        // Success Case
        return right(userProfileModel);
      } else {
        // Server Error Case
        return left(ServerFailure(
          failureTitle: 'profile.server_failure'.tr(),
          errorMessage: userProfileModel.message!,
        ));
      }
    } on DioException {
      return left(
          // Unexpected DioError (e.g., timeout, internet connection)
          NetworkFailure(
        failureTitle: 'shared.network_error'.tr(),
        errorMessage: 'shared.check_internet'.tr(),
      ));
    } 
    catch (e) {
      // General unexpected error
      log(e.toString());
      return left(Failure(
        failureTitle: 'shared.error'.tr(),
        errorMessage: 'shared.error_message'.tr(),
      ));
    }
  }
}
