import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../data/models/store_details_model.dart';

abstract class BaseRestaurantStoreDetailsRepo {
  Future<Either<Failure, StoreDetailsModel>> getStoreDetails({required String storeId});
}
