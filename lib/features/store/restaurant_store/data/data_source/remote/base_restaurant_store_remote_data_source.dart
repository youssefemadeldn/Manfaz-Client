import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../../models/store_list_model.dart';

abstract class BaseRestaurantStoreRemoteDataSource {
  Future<Either<Failure, StoreListModel>> getStoreList({
    required int limit,
    required int page,
    required String search,
    required String categoryId,
  });
}
