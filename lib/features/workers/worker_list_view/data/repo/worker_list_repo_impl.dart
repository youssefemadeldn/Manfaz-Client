import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/workers/worker_list_view/data/data_source/remote/base_worker_list_remote_data_source.dart';
import 'package:manfaz/features/workers/worker_list_view/data/models/worker_list_model.dart';
import 'package:manfaz/features/workers/worker_list_view/domain/repo/base_worker_list_repo.dart';

@Injectable(as: BaseWorkerListRepo)
class WorkerListRepoImpl implements BaseWorkerListRepo {
  final BaseWorkerListRemoteDataSource baseWorkerListRemoteDataSource;

  WorkerListRepoImpl(this.baseWorkerListRemoteDataSource);

  @override
  Future<Either<Failure, WorkerListModel>> getWorkerList() {
    return baseWorkerListRemoteDataSource.getWorkerList();
  }
}
