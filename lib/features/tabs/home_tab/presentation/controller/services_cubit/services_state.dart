part of 'services_cubit.dart';

abstract class ServicesState {}

class ServicesInitial extends ServicesState {}

class ServicesLoadingState extends ServicesState {}

class ServicesSuccessState extends ServicesState {
  final ServicesBasedOnCategoryModel servicesBasedOnCategoryModel;

  ServicesSuccessState({required this.servicesBasedOnCategoryModel});
}

class ServicesErrorState extends ServicesState {
  final Failure failure;

  ServicesErrorState({required this.failure});
}
