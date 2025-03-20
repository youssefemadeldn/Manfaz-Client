import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';
import '../../models/store_details_model.dart';

abstract class BaseRestaurantStoreDetailsRemoteDataSource {
  Future<Either<Failure, StoreDetailsModel>> getStoreDetails({required String storeId});
}
