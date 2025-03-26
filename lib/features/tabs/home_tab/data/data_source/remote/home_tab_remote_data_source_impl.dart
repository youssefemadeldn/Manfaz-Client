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

import 'package:manfaz/features/tabs/home_tab/data/models/home_tab_model.dart';
import 'package:manfaz/features/tabs/home_tab/data/models/services_based_on_category_model.dart';

import '../../../../../../core/di/di.dart';
import 'base_home_tab_remote_data_source.dart';

@Injectable(as: BaseHomeTabRemoteDataSource)
class HomeTabRemoteDataSourceImpl implements BaseHomeTabRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

    // Use provided language or default to 'en'
    final currentLanguage = EasyLocalizationHelper().getCurrentLocale();
  @override
  Future<Either<Failure, HomeTabModel>> getHomeTabData() async {
    try {

      // make request with language parameter
      var response = await apiManager.getData(
        ApiConstant.epHomeTap,
        queryParameters: {'lang': currentLanguage},
      );
      HomeTabModel homeTapModel = HomeTabModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: homeTapModel.code)) {
        // Success Case
        return right(homeTapModel);
      } else {
        // Server Error Case
        return left(ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: homeTapModel.message!,
        ));
      }
    } on DioException {
      return left(
          // Unexpected DioError (e.g., timeout, internet connection)
          NetworkFailure(
        failureTitle: 'Network',
        errorMessage: 'Check your internet connection',
      ));
    } 
    catch (e) {
      // General unexpected error
      return left(Failure(
        failureTitle: 'Server Failure',
        errorMessage: e.toString(),
      ));
    }
  }   

  @override
  Future<Either<Failure, ServicesBasedOnCategoryModel>> getServicesBasedOnCategory({required String categoryId, required String type}) async{
    try {
    var response   = await apiManager.getData(ApiConstant.epGetServicesBasedOnCategory,
      queryParameters: {'lang': currentLanguage, 'categoryId': categoryId, 'type': type},
       );

      ServicesBasedOnCategoryModel servicesBasedOnCategoryModel = ServicesBasedOnCategoryModel.fromJson(response.data);
      if (NetworkHelper.isValidResponse(code: servicesBasedOnCategoryModel.code)) {
        // Success Case
        return right(servicesBasedOnCategoryModel);
      } else {
        // Server Error Case
        return left(ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: servicesBasedOnCategoryModel.message!,
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
        failureTitle: 'Server Failure',
        errorMessage: 'shared.error_message'.tr(),
      ));
    }
  }
}
