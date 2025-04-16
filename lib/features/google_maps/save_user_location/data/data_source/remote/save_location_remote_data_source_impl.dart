import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/helper/easy_localization_helper.dart';
import '../../../../../../core/network/api_constant.dart';
import '../../../../../../core/network/api_manager.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../../../../../core/di/di.dart';
import '../../../../get_user_location/data/models/save_user_location_response_model.dart';
import 'base_save_location_remote_data_source.dart';

@Injectable(as: BaseSaveLocationRemoteDataSource)
class SaveLocationRemoteDataSourceImpl implements BaseSaveLocationRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();
  final currentLanguage = EasyLocalizationHelper().getCurrentLocale();

  @override
  Future<Either<Failure, SaveUserLocationResponseModel>> saveUserLocation({
    required String address,
    required double latitude,
    required double longitude,
    required String type,
    String? name,
    String? notes,
  }) async {
    try {
      // Get userId from SharedPreferences
      final userId = await SharedPrefUtils.getData('userId');
      
      if (userId == null) {
        return left(ServerFailure(
          failureTitle: 'shared.error'.tr(),
          errorMessage: tr('error.user_not_found')));
      }

      final body = {
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'type': type,
        if (name != null && name.isNotEmpty) 'name': name,
        if (notes != null && notes.isNotEmpty) 'notes': notes,
      };

      log('SaveUserLocation Request: $body');
      
      final response = await apiManager.postData(
        '${ApiConstant.epSaveUserLocation}/$userId',
        body: body,
        queryParameters: {
          'lang': currentLanguage,
        },
      );

      final model = SaveUserLocationResponseModel.fromJson(response.data);
      
      if (NetworkHelper.isValidResponse(code: response.statusCode)) {
        return right(model);
      } else {
        return left(ServerFailure(
          failureTitle: 'shared.error'.tr(),
          errorMessage: model.message ?? tr('error.error')));
      }
    } on DioException catch (e) {
      log('SaveUserLocation DioException: ${e.message}');
      return left(ServerFailure(
        failureTitle: 'shared.error'.tr(),
        errorMessage: e.message ?? tr('error.error')));
    } catch (e) {
      log('SaveUserLocation Exception: $e');
      return left(ServerFailure(
        failureTitle: 'shared.error'.tr(),
        errorMessage: tr('error.error')));
    }
  }
}
