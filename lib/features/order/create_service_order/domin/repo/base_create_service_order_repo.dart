import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../data/models/create_service_order_model.dart';

abstract class BaseCreateServiceOrderRepo {
  Future<Either<Failure, CreateServiceOrderModel>> createServiceOrder({
    required String userId,
    required String serviceId,
    required String providerId,
    required String notes,
    required double price,
    required int duration,
    required String status,
    required double totalAmount,
    required String paymentStatus,
    required String type,
    required String paymentMethod,
    required String address,
    required double latitude,
    required double longitude,
  });
}
