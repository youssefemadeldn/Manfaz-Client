import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../domain/repo/base_restaurant_store_repo.dart';
import '../data_source/remote/base_restaurant_store_remote_data_source.dart';
import '../models/store_list_model.dart';

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
  }) {
    return baseRestaurantStoreRemoteDataSource.getStoreList(
      limit: limit,
      page: page,
      search: search,
      categoryId: categoryId,
    );
  }
}
