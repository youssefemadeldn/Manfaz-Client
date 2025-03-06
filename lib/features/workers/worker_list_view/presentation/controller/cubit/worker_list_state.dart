part of 'worker_list_cubit.dart';

@immutable
sealed class WorkerListState {}

final class WorkerListInitial extends WorkerListState {}
final class WorkerListLoading extends WorkerListState {}
final class WorkerListSuccess extends WorkerListState {
  final WorkerListModel workerListModel;
  WorkerListSuccess(this.workerListModel);
}
final class WorkerListFailure extends WorkerListState {
  final Failure failure;
  WorkerListFailure(this.failure);
}

