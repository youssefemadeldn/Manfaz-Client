import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../data/models/create_service_order_model.dart';
import '../repo/base_create_service_order_repo.dart';

@injectable
class CreateServiceOrderUseCase {
  final BaseCreateServiceOrderRepo baseCreateServiceOrderRepo;

  CreateServiceOrderUseCase(this.baseCreateServiceOrderRepo);

  Future<Either<Failure, CreateServiceOrderModel>> call({
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
  }) =>
      baseCreateServiceOrderRepo.createServiceOrder(
        userId: userId,
        serviceId: serviceId,
        providerId: providerId,
        locationId: locationId,
        notes: notes,
        price: price,
        duration: duration,
        status: status,
        totalAmount: totalAmount,
        paymentStatus: paymentStatus,
        type: type,
        paymentMethod: paymentMethod,
      );
}
