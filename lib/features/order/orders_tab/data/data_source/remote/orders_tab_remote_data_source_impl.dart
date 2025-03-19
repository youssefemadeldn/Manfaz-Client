import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/helper/easy_localization_helper.dart';
import '../../../../../../core/network/api_constant.dart';
import '../../../../../../core/network/api_manager.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../models/orders_list_model.dart';
import 'base_orders_tab_remote_data_source.dart';

@Injectable(as: BaseOrdersTabRemoteDataSource)
class OrdersTabRemoteDataSourceImpl implements BaseOrdersTabRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

  // Use provided language or default to 'en'
  final currentLanguage = EasyLocalizationHelper().getCurrentLocale();

  @override
  Future<Either<Failure, OrdersListModel>> getOrdersTabData() async {
    try {
      // make request with language parameter
      var response = await apiManager.getData(
        ApiConstant.epOrder,
        queryParameters: {'lang': currentLanguage},
      );
      OrdersListModel ordersListModel = OrdersListModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: ordersListModel.code)) {
        // Success Case
        return right(ordersListModel);
      } else {
        // Server Error Case
        return left(ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: ordersListModel.message!,
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
