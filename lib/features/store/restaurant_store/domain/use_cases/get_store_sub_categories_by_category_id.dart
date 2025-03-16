import 'package:dartz/dartz.dart';
import 'package:manfaz/features/store/restaurant_store/data/models/store_sub_categories_list.dart';

import '../../../../../core/error/failure.dart';
import '../repo/base_restaurant_store_repo.dart';

class GetStoreSubCategoriesByCategoryId {
  final BaseRestaurantStoreRepo baseRestaurantStoreRepo;

  GetStoreSubCategoriesByCategoryId(this.baseRestaurantStoreRepo);

  Future<Either<Failure, StoreSubCategoriesList>> call({
    required String categoryId,
    required int limit,
    required int page,
    String? search,
  }) async {
    return await baseRestaurantStoreRepo.getStoreSubCategoriesByCategoryId(
      categoryId: categoryId,
      limit: limit,
      page: page,
      search: search,
    );
  }
}
