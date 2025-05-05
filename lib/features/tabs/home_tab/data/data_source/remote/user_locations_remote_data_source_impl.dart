import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/network/api_constant.dart';
import '../../../../../../core/network/api_manager.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/helper/easy_localization_helper.dart';
import '../../models/get_user_locations_response_model.dart';
import 'base_user_locations_remote_data_source.dart';

@Injectable(as: BaseUserLocationsRemoteDataSource)
class UserLocationsRemoteDataSourceImpl implements BaseUserLocationsRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();
  final currentLanguage = EasyLocalizationHelper().getCurrentLocale();

  @override
  Future<Either<Failure, GetUserLocationsResponseModel>> getUserLocations({
    required String userId,
  }) async {
    try {
      var response = await apiManager.getData(
        "${ApiConstant.epLocation}/$userId",
        queryParameters: {'lang': currentLanguage},
      );

      final model = GetUserLocationsResponseModel.fromJson(response.data);
      if (NetworkHelper.isValidResponse(code: response.statusCode)) {
        return right(model);
      } else {
        return left(ServerFailure(
          failureTitle: "shared.network_error".tr(),
          errorMessage: model.message ?? "home.error_fetching_locations".tr(),
        ));
      }
    } catch (e) {
      log("Error fetching user locations: $e");
      return left(ServerFailure(
        failureTitle: "shared.error".tr(),
        errorMessage: "home.error_fetching_locations".tr(),
      ));
    }
  }
}
