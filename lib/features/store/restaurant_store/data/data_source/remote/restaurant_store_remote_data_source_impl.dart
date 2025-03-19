import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/core/network/api_constant.dart';
import 'package:manfaz/core/network/api_manager.dart';
import 'package:manfaz/core/network/network_helper.dart';
import 'package:manfaz/core/di/di.dart';
import '../../../../../../core/helper/easy_localization_helper.dart';
import '../../models/store_list_model.dart';
import '../../models/store_sub_categories_list.dart';
import 'base_restaurant_store_remote_data_source.dart';

@Injectable(as: BaseRestaurantStoreRemoteDataSource)
class RestaurantStoreRemoteDataSourceImpl implements BaseRestaurantStoreRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();
      // Use provided language or default to 'en'
    final currentLanguage = EasyLocalizationHelper().getCurrentLocale();

  @override
  Future<Either<Failure, StoreListModel>> getStoreList({
    required int limit,
    required int page,
    required String search,
    required String categoryId,
  }) async {
    try {
      var response = await apiManager.getData(
        ApiConstant.epStore,
        queryParameters: {
          'lang': currentLanguage,
          'limit': limit,
          'page': page,
          'search': search,
          'categoryId': categoryId,
        },
      );

      StoreListModel storeListModel = StoreListModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: storeListModel.code)) {
        // Success Case
        return right(storeListModel);
      } else {
        // Server Error Case
        return left(ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: storeListModel.message!,
        ));
      }
    } on DioException {
      return left(
        // Unexpected DioError (e.g., timeout, internet connection)
        NetworkFailure(
          failureTitle: 'Network',
          errorMessage: 'Check your internet connection',
        ));
    } catch (e) {
      // General unexpected error
      return left(Failure(
        failureTitle: 'Server Failure',
        errorMessage: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, StoreSubCategoriesList>> getStoreSubCategoriesByCategoryId({
    required String categoryId,
    required int limit,
    required int page,
    String? search,
  }) async {
    try {
      var response = await apiManager.getData(
        ApiConstant.epStoreSubCategories,
        queryParameters: {
          'lang': currentLanguage,
          'limit': limit,
          'page': page,
          'search': search ?? '',
          'categoryId': categoryId,
        },
      );

      StoreSubCategoriesList storeSubCategoriesList = StoreSubCategoriesList.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: storeSubCategoriesList.code)) {
        // Success Case
        return right(storeSubCategoriesList);
      } else {
        // Server Error Case
        return left(ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: storeSubCategoriesList.message!,
        ));
      }
    } on DioException {
      return left(
        // Unexpected DioError (e.g., timeout, internet connection)
        NetworkFailure(
          failureTitle: 'Network',
          errorMessage: 'Check your internet connection',
        ));
    } catch (e) {
      // General unexpected error
      return left(Failure(
        failureTitle: 'Server Failure',
        errorMessage: e.toString(),
      ));
    }
  }

}
