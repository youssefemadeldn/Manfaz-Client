import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/features/store/restaurant_store_details/data/models/create_delivery_order_model.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/helper/easy_localization_helper.dart';
import '../../../../../../core/network/api_constant.dart';
import '../../../../../../core/network/api_manager.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../models/store_details_model.dart';
import 'base_restaurant_store_details_remote_data_source.dart';

@Injectable(as: BaseRestaurantStoreDetailsRemoteDataSource)
class RestaurantStoreDetailsRemoteDataSourceImpl
    implements BaseRestaurantStoreDetailsRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

  // Use provided language or default to 'en'
  final currentLanguage = EasyLocalizationHelper().getCurrentLocale();

  @override
  Future<Either<Failure, StoreDetailsModel>> getStoreDetails(
      {required String storeId}) async {
    try {
      // Make request with language parameter
      var response = await apiManager.getData(
        '${ApiConstant.epStore}/$storeId',
        queryParameters: {'lang': currentLanguage},
      );

      StoreDetailsModel storeDetailsModel =
          StoreDetailsModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: storeDetailsModel.code)) {
        // Success Case
        return right(storeDetailsModel);
      } else {
        // Server Error Case
        return left(ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: storeDetailsModel.message!,
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
  Future<Either<Failure, CreateDeliveryOrderModel>> createDeliveryOrder(
      {required String userId,
      required String address,
      required String notes,
      required double latitude,
      required double longitude,
      required double price,
      required int duration,
      required String status,
      required double totalAmount,
      required String paymentStatus,
      required String type,
      required List<Map<String, dynamic>> store,
      required String paymentMethod}) async {
    try {
      // Make request with language parameter
      var response = await apiManager.postData(
        ApiConstant.epOrder,
        queryParameters: {'lang': currentLanguage},
        body: {
          "userId": userId,
          "address": address,
          "notes": notes,
          "latitude": latitude,
          "longitude": longitude,
          "price": price,
          "duration": duration,
          "status": status,
          "totalAmount": totalAmount,
          "paymentStatus": paymentStatus,
          "type": type,
          "store": store,
          "paymentMethod": paymentMethod
        },
      );

      CreateDeliveryOrderModel createDeliveryOrderModel =
          CreateDeliveryOrderModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: createDeliveryOrderModel.code)) {
        // Success Case
        return right(createDeliveryOrderModel);
      } else {
        // Server Error Case
        return left(ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: createDeliveryOrderModel.message!,
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
