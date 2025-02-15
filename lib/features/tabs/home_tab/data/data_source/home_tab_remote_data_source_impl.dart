import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/core/helper/easy_localization_helper.dart';
import 'package:manfaz/core/network/api_constant.dart';
import 'package:manfaz/core/network/api_manager.dart';
import 'package:manfaz/core/network/network_helper.dart';

import 'package:manfaz/features/tabs/home_tab/data/models/home_tab_model.dart';

import '../../../../../core/di/di.dart';
import 'base_home_tab_remote_data_source.dart';

@Injectable(as: BaseHomeTabRemoteDataSource)
class HomeTabRemoteDataSourceImpl implements BaseHomeTabRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

  @override
  Future<Either<Failure, HomeTabModel>> getHomeTabData() async {
    try {
      // Use provided language or default to 'en'
      final currentLanguage =
          EasyLocalizationHelper().getCurrentLocale() ?? 'en';

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
    // catch (e) {
    //   // General unexpected error
    //   return left(Failure(
    //     failureTitle: 'Server Failure',
    //     errorMessage: e.toString(),
    //   ));
    // }
  }
}
