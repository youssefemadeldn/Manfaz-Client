import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/servicses/services_list_view_view/data/model/parameters_services_list_model.dart';
import 'package:manfaz/features/servicses/services_list_view_view/domain/repo/base_services_list_view_repo.dart';

@injectable
class ServicesListParametersUseCase {
  final BaseServicesListViewRepo baseServicesListViewRepo;

  ServicesListParametersUseCase(this.baseServicesListViewRepo);

  Future<Either<Failure, ParametersServicesListModel>> call({
    required String categoryId,
    required String type,
  }) =>
      baseServicesListViewRepo.getServicesParameters(
        categoryId: categoryId,
        type: type,
      );
}
