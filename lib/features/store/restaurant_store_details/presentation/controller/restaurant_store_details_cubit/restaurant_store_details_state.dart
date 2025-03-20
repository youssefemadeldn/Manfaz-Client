part of 'restaurant_store_details_cubit.dart';

@immutable
sealed class RestaurantStoreDetailsState {}

final class RestaurantStoreDetailsInitial extends RestaurantStoreDetailsState {}
final class RestaurantStoreDetailsLoading extends RestaurantStoreDetailsState {}
final class RestaurantStoreDetailsSuccess extends RestaurantStoreDetailsState {
  final StoreDetailsModel storeDetails;
  RestaurantStoreDetailsSuccess({required this.storeDetails});
}
final class RestaurantStoreDetailsError extends RestaurantStoreDetailsState {
  final Failure failure;
  RestaurantStoreDetailsError({required this.failure});
}
