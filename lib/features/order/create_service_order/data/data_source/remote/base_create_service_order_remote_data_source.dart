import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../../models/create_service_order_model.dart';

abstract class BaseCreateServiceOrderRemoteDataSource {
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
  });
}
