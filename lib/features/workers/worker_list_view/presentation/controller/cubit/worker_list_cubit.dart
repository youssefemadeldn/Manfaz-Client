import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/error/failure.dart';
import '../../../data/models/worker_list_model.dart';
import '../../../domain/use_cases/worker_list_use_case.dart';

part 'worker_list_state.dart';

@injectable
class WorkerListCubit extends Cubit<WorkerListState> {
  final WorkerListUseCase workerListUseCase;
  WorkerListCubit( { required this.workerListUseCase} ) : super(WorkerListInitial());

  Future<void> fetchWorker()async{
    emit(WorkerListLoading());
    final result = await workerListUseCase.call();
    result.fold(
      (failure) => emit(WorkerListFailure(failure)),
      (success) => emit(WorkerListSuccess(success)),
    );
  } 
}
