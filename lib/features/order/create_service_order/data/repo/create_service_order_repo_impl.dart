import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../domin/repo/base_create_service_order_repo.dart';
import '../data_source/remote/base_create_service_order_remote_data_source.dart';
import '../models/create_service_order_model.dart';

@Injectable(as: BaseCreateServiceOrderRepo)
class CreateServiceOrderRepoImpl implements BaseCreateServiceOrderRepo {
  final BaseCreateServiceOrderRemoteDataSource
      baseCreateServiceOrderRemoteDataSource;

  CreateServiceOrderRepoImpl(this.baseCreateServiceOrderRemoteDataSource);

  @override
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
  }) {
    return baseCreateServiceOrderRemoteDataSource.createServiceOrder(
      userId: userId,
      serviceId: serviceId,
      providerId: providerId,
      notes: notes,
      price: price,
      duration: duration,
      status: status,
      totalAmount: totalAmount,
      paymentStatus: paymentStatus,
      type: type,
      paymentMethod: paymentMethod,
      address: address,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
