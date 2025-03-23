import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../data/models/create_delivery_order_model.dart';
import '../../data/models/store_details_model.dart';

abstract class BaseRestaurantStoreDetailsRepo {
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

