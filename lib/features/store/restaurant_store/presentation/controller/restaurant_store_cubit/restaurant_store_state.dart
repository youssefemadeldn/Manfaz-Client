part of 'restaurant_store_cubit.dart';

@immutable
sealed class RestaurantStoreState {}

final class RestaurantStoreInitial extends RestaurantStoreState {}
final class RestaurantStoreLoading extends RestaurantStoreState {}
final class RestaurantStoreSuccess extends RestaurantStoreState {
  final StoreListModel storeListModel;
  final String filterId;
  
  RestaurantStoreSuccess({
    required this.storeListModel,
    required this.filterId,
  });
}
final class RestaurantStoreError extends RestaurantStoreState {
  final Failure failure;
  RestaurantStoreError({required this.failure});
}