import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/tabs/home_tab/data/models/home_tab_model.dart';
import 'package:manfaz/features/tabs/home_tab/data/models/services_based_on_category_model.dart';
import '../../domin/repo/base_home_tab_repo.dart';
import '../data_source/remote/base_home_tab_remote_data_source.dart';

@Injectable(as: BaseHomeTabRepo)
class HomeTabRepoImpl implements BaseHomeTabRepo {
  final BaseHomeTabRemoteDataSource baseHomeTabRemoteDataSource;
  HomeTabRepoImpl(this.baseHomeTabRemoteDataSource);

  @override
  Future<Either<Failure, HomeTabModel>> getHomeTabData() {
    return baseHomeTabRemoteDataSource.getHomeTabData();
  }

  @override
  Future<Either<Failure, ServicesBasedOnCategoryModel>> getServicesBasedOnCategory(
      {required String categoryId, required String type}) {
    return baseHomeTabRemoteDataSource.getServicesBasedOnCategory(
        categoryId: categoryId, type: type);
  }
}
