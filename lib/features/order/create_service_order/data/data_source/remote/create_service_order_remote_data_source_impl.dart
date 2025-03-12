import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/helper/easy_localization_helper.dart';
import '../../../../../../core/network/api_constant.dart';
import '../../../../../../core/network/api_manager.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../models/create_service_order_model.dart';
import 'base_create_service_order_remote_data_source.dart';

@Injectable(as: BaseCreateServiceOrderRemoteDataSource)
class CreateServiceOrderRemoteDataSourceImpl
    implements BaseCreateServiceOrderRemoteDataSource {
  ApiManager apiManager = getIt<ApiManager>();

  @override
  Future<Either<Failure, CreateServiceOrderModel>> createServiceOrder({
    required String userId,
    required String serviceId,
    required String providerId,
    required String locationId,
    required String notes,
    required double price,
    required int duration,
    required String status,
    required double totalAmount,
    required String paymentStatus,
    required String type,
    required String paymentMethod,
  }) async {
    try {
      final currentLanguage = EasyLocalizationHelper().getCurrentLocale();

      var response = await apiManager.postData(
        ApiConstant.epOrder,
        queryParameters: {'lang': currentLanguage},
        body: {
          'userId': userId,
          'serviceId': serviceId,
          'providerId': providerId,
          'locationId': locationId,
          'notes': notes,
          'price': price,
          'duration': duration,
          'status': status,
          'totalAmount': totalAmount,
          'paymentStatus': paymentStatus,
          'type': type,
          'paymentMethod': paymentMethod,
        },
      );

      CreateServiceOrderModel createServiceOrderModel =
          CreateServiceOrderModel.fromJson(response.data);

      if (NetworkHelper.isValidResponse(code: createServiceOrderModel.code)) {
        return right(createServiceOrderModel);
      } else {
        return left(ServerFailure(
          failureTitle: 'Server Failure',
          errorMessage: createServiceOrderModel.message!,
        ));
      }
    } on DioException {
      return left(NetworkFailure(
        failureTitle: 'Network',
        errorMessage: 'Check your internet connection',
      ));
    } catch (e) {
      return left(Failure(
        failureTitle: 'Server Failure',
        errorMessage: e.toString(),
      ));
    }
  }
}
