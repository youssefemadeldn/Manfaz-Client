import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';
import '../../models/home_tab_model.dart';
import '../../models/services_based_on_category_model.dart';

abstract class BaseHomeTabRemoteDataSource  {
  Future<Either<Failure, HomeTabModel>> getHomeTabData();

  Future<Either<Failure, ServicesBasedOnCategoryModel>> getServicesBasedOnCategory({required String categoryId, required String type});
}
