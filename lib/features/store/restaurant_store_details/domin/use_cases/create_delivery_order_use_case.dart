import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../data/models/create_delivery_order_model.dart';
import '../repo/base_restaurant_store_details_repo.dart';

@injectable
class CreateDeliveryOrderUseCase {
  final BaseRestaurantStoreDetailsRepo baseRestaurantStoreDetailsRepo;

  CreateDeliveryOrderUseCase(this.baseRestaurantStoreDetailsRepo);

  Future<Either<Failure, CreateDeliveryOrderModel>> call({
    required String userId,
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
    required String paymentMethod,
  }) => baseRestaurantStoreDetailsRepo.createDeliveryOrder(
    userId: userId,
    address: address,
    notes: notes,
    latitude: latitude,
    longitude: longitude,
    price: price,
    duration: duration,
    status: status,
    totalAmount: totalAmount,
    paymentStatus: paymentStatus,
    type: type,
    store: store,
    paymentMethod: paymentMethod,
  );
}