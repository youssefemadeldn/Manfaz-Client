import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';
import '../../models/store_details_model.dart';
import '../../models/create_delivery_order_model.dart';

abstract class BaseRestaurantStoreDetailsRemoteDataSource {
  Future<Either<Failure, StoreDetailsModel>> getStoreDetails({required String storeId});
   Future<Either<Failure, CreateDeliveryOrderModel>> createDeliveryOrder({
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
  });
}
