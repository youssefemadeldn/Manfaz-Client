import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/services_list_view_view/data/data_source/remote/base_services_list_view_remote_data_source.dart';
import 'package:manfaz/features/services_list_view_view/data/model/parameters_service_model.dart';
import 'package:manfaz/features/services_list_view_view/domain/repo/base_services_list_view_repo.dart';

@Injectable(as: BaseServicesListViewRepo)
class ServicesListViewRepoImpl implements BaseServicesListViewRepo {
  final BaseServicesListViewRemoteDataSource baseServicesListViewRemoteDataSource;
  
  ServicesListViewRepoImpl(this.baseServicesListViewRemoteDataSource);

  @override
  Future<Either<Failure, ParametersServicesListModel>> getServicesParameters({
    required String categoryId,
    required String type,
  }) {
    return baseServicesListViewRemoteDataSource.getServicesParameters(
      categoryId: categoryId,
      type: type,
    );
  }
}
