import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../domin/repo/base_restaurant_store_details_repo.dart';
import '../data_source/remote/base_restaurant_store_details_remote_data_source.dart';
import '../models/store_details_model.dart';

@Injectable(as: BaseRestaurantStoreDetailsRepo)
class RestaurantStoreDetailsRepoImpl implements BaseRestaurantStoreDetailsRepo {
  final BaseRestaurantStoreDetailsRemoteDataSource baseRestaurantStoreDetailsRemoteDataSource;
  
  RestaurantStoreDetailsRepoImpl(this.baseRestaurantStoreDetailsRemoteDataSource);

  @override
  Future<Either<Failure, StoreDetailsModel>> getStoreDetails({required String storeId}) {
    return baseRestaurantStoreDetailsRemoteDataSource.getStoreDetails(storeId: storeId);
  }
}
