import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../domin/repo/base_restaurant_store_details_repo.dart';
import '../data_source/remote/base_restaurant_store_details_remote_data_source.dart';
import '../models/create_delivery_order_model.dart';
import '../models/store_details_model.dart';

@Injectable(as: BaseRestaurantStoreDetailsRepo)
class RestaurantStoreDetailsRepoImpl implements BaseRestaurantStoreDetailsRepo {
  final BaseRestaurantStoreDetailsRemoteDataSource baseRestaurantStoreDetailsRemoteDataSource;
  
  RestaurantStoreDetailsRepoImpl(this.baseRestaurantStoreDetailsRemoteDataSource);

  @override
  Future<Either<Failure, StoreDetailsModel>> getStoreDetails({required String storeId}) {
    return baseRestaurantStoreDetailsRemoteDataSource.getStoreDetails(storeId: storeId);
  }

  @override
  Future<Either<Failure, CreateDeliveryOrderModel>> createDeliveryOrder({required String userId, required String address, required String notes, required double latitude, required double longitude, required double price, required int duration, required String status, required double totalAmount, required String paymentStatus, required String type, required List<Map<String, dynamic>> store, required String paymentMethod}) {
    return baseRestaurantStoreDetailsRemoteDataSource.createDeliveryOrder(userId: userId, address: address, notes: notes, latitude: latitude, longitude: longitude, price: price, duration: duration, status: status, totalAmount: totalAmount, paymentStatus: paymentStatus, type: type, store: store, paymentMethod: paymentMethod);
  }
}
