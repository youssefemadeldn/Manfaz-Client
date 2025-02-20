import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../data/models/services_based_on_category_model.dart';
import '../../data/models/home_tab_model.dart';

abstract class BaseHomeTabRepo {
  Future<Either<Failure, HomeTabModel>> getHomeTabData(); // or getHomeCategories()

  Future<Either<Failure, ServicesBasedOnCategoryModel>> getServicesBasedOnCategory();
}
