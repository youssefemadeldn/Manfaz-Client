import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/tabs/home_tab/data/models/home_tab_model.dart';
import '../../domain/repo/base_home_tab_repo.dart';
import '../data_source/base_home_tab_remote_data_source.dart';

@Injectable( as: BaseHomeTabRepo)
class HomeTabRepoImpl implements BaseHomeTabRepo {
  final BaseHomeTabRemoteDataSource baseHomeTabRemoteDataSource;
  HomeTabRepoImpl(this.baseHomeTabRemoteDataSource);
  @override
  Future<Either<Failure, HomeTapModel>> getHomeTabData() {
    return baseHomeTabRemoteDataSource.getHomeTabData();
  }
}