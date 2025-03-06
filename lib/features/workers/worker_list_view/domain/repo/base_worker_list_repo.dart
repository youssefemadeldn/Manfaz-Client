import 'package:dartz/dartz.dart';
import 'package:manfaz/core/error/failure.dart';
import 'package:manfaz/features/workers/worker_list_view/data/models/worker_list_model.dart';

abstract class BaseWorkerListRepo {
  Future<Either<Failure, WorkerListModel>> getWorkerList();
}
