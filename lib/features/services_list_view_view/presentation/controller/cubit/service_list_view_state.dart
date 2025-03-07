part of 'service_list_view_cubit.dart';

@immutable
sealed class ServiceListViewState {}

final class ServiceListViewInitial extends ServiceListViewState {}
final class ServiceListViewLoading extends ServiceListViewState {}
final class ServiceListViewSuccess extends ServiceListViewState {
  final ParametersServicesListModel parametersServicesListModel;

  ServiceListViewSuccess(this.parametersServicesListModel);
}
final class ServiceListViewFailure extends ServiceListViewState {
  final Failure failure;

  ServiceListViewFailure(this.failure);
}
