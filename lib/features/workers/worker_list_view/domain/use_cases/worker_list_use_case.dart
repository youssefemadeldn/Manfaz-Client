import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/workers/worker_list_view/data/models/worker_list_model.dart';
import 'package:manfaz/features/workers/worker_list_view/domain/repo/base_worker_list_repo.dart';

@injectable
class WorkerListUseCase {
  final BaseWorkerListRepo baseWorkerListRepo;

  WorkerListUseCase(this.baseWorkerListRepo);

  Future<Either<Failure, WorkerListModel>> call() => 
      baseWorkerListRepo.getWorkerList();
}
