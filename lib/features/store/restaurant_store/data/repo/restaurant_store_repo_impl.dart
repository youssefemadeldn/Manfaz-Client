import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../domin/repo/base_restaurant_store_repo.dart';
import '../data_source/remote/base_restaurant_store_remote_data_source.dart';
import '../models/store_list_model.dart';
import '../models/store_sub_categories_list.dart';

@Injectable(as: BaseRestaurantStoreRepo)
class RestaurantStoreRepoImpl implements BaseRestaurantStoreRepo {
  final BaseRestaurantStoreRemoteDataSource baseRestaurantStoreRemoteDataSource;
  RestaurantStoreRepoImpl(this.baseRestaurantStoreRemoteDataSource);

  @override
  Future<Either<Failure, StoreListModel>> getStoreList({
    required int limit,
    required int page,
    required String search,
    required String categoryId,
    String? filterId,
  }) {
    return baseRestaurantStoreRemoteDataSource.getStoreList(
      limit: limit,
      page: page,
      search: search,
      categoryId: categoryId,
      filterId: filterId,
    );
  }

  @override
  Future<Either<Failure, StoreSubCategoriesList>> getStoreSubCategoriesByCategoryId({
    required String categoryId,
    required int limit,
    required int page,
    String? search,
  }) {
    return baseRestaurantStoreRemoteDataSource.getStoreSubCategoriesByCategoryId(
      categoryId: categoryId,
      limit: limit,
      page: page,
      search: search,
    );
  }
}
