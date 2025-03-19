import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../data/models/store_list_model.dart';
import '../repo/base_restaurant_store_repo.dart';

@injectable
class RestaurantStoreUseCase {
  final BaseRestaurantStoreRepo baseRestaurantStoreRepo;

  RestaurantStoreUseCase(this.baseRestaurantStoreRepo);

  Future<Either<Failure, StoreListModel>> call({
    required int limit,
    required int page,
    required String search,
    required String categoryId,
     String? filterId,
  }) => baseRestaurantStoreRepo.getStoreList(
    limit: limit,
    page: page,
    search: search,
    categoryId: categoryId,
    filterId: filterId,
  );
}
