import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../../models/store_list_model.dart';
import '../../models/store_sub_categories_list.dart';

abstract class BaseRestaurantStoreRemoteDataSource {
  Future<Either<Failure, StoreListModel>> getStoreList({
    required int limit,
    required int page,
    required String search,
    required String categoryId,
    String? filterId,
  });

  Future<Either<Failure, StoreSubCategoriesList>> getStoreSubCategoriesByCategoryId({
    required String categoryId,
    required int limit,
    required int page,
    String? search,
    
  });
}
