import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../data/models/services_based_on_category_model.dart';
import '../repo/base_home_tab_repo.dart';

@injectable
class GetServicesBasedOnCategoryUseCase {
  final BaseHomeTabRepo baseHomeTabRepo;

  GetServicesBasedOnCategoryUseCase(this.baseHomeTabRepo);

  Future<Either<Failure, ServicesBasedOnCategoryModel>> call(
          {required String categoryId, required String type}) =>
      baseHomeTabRepo.getServicesBasedOnCategory(
          categoryId: categoryId, type: type);
}
