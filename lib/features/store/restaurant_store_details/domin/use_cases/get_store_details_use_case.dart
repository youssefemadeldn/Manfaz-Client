import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../data/models/store_details_model.dart';
import '../repo/base_restaurant_store_details_repo.dart';

@injectable
class GetStoreDetailsUseCase {
  final BaseRestaurantStoreDetailsRepo baseRestaurantStoreDetailsRepo;

  GetStoreDetailsUseCase(this.baseRestaurantStoreDetailsRepo);

  Future<Either<Failure, StoreDetailsModel>> call({required String storeId}) =>
      baseRestaurantStoreDetailsRepo.getStoreDetails(storeId: storeId);
}
