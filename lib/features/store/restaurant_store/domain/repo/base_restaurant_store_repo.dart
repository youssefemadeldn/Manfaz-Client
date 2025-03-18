import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../data/models/store_list_model.dart';
import '../../data/models/store_sub_categories_list.dart';

abstract class BaseRestaurantStoreRepo {
  Future<Either<Failure, StoreListModel>> getStoreList({
    required int limit,
    required int page,
    required String search,
    required String categoryId,
  });

  Future<Either<Failure, StoreSubCategoriesList>> getStoreSubCategoriesByCategoryId({
    required String categoryId,
    required int limit,
    required int page,
    String? search,
  });
}
