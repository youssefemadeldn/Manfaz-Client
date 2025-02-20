part of 'home_tab_cubit.dart';

@immutable
sealed class HomeTabState {}

final class HomeTabInitialState extends HomeTabState {}

final class HomeTabLoadingState extends HomeTabState {}

final class HomeTabSuccessState extends HomeTabState {
  final HomeTabModel homeTapModel;

  HomeTabSuccessState({required this.homeTapModel});
}

final class HomeTabErrorState extends HomeTabState {
  final Failure failure;

  HomeTabErrorState({required this.failure});
}

final class ServiceBottomSheetLoadingState extends HomeTabState {}

final class ServiceBottomSheetErrorState extends HomeTabState {
  final Failure failure;

  ServiceBottomSheetErrorState({required this.failure});
}

final class ServiceBottomSheetSuccessState extends HomeTabState {
  final ServicesBasedOnCategoryModel servicesBasedOnCategoryModel;

  ServiceBottomSheetSuccessState({required this.servicesBasedOnCategoryModel});
}
