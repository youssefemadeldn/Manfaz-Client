import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../data/models/home_tab_model.dart';

abstract class BaseHomeTabRepo {
  Future<Either<Failure, HomeTabModel>>
      getHomeTabData(); // or getHomeCategories()
}
