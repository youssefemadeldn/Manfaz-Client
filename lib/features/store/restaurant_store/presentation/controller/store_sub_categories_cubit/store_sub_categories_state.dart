part of 'store_sub_categories_cubit.dart';

@immutable
sealed class StoreSubCategoriesState  {}

final class StoreSubCategoriesInitial extends StoreSubCategoriesState {}
final class StoreSubCategoriesLoading extends StoreSubCategoriesState {}
final class StoreSubCategoriesSuccess extends StoreSubCategoriesState {
  final StoreSubCategoriesList storeSubCategoriesList;
  StoreSubCategoriesSuccess({required this.storeSubCategoriesList});
}
final class StoreSubCategoriesError extends StoreSubCategoriesState {
  final Failure failure;
  StoreSubCategoriesError({required this.failure});
}
