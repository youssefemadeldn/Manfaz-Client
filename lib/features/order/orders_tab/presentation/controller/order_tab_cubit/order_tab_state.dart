part of 'order_tab_cubit.dart';

@immutable
sealed class OrderTabState {}

final class OrderTabInitial extends OrderTabState {}
final class OrderTabLoading extends OrderTabState {}
final class OrderTabSuccess extends OrderTabState {
  final OrdersListModel ordersList;
  OrderTabSuccess(this.ordersList);
}
final class OrderTabError extends OrderTabState {
   final Failure failure;
   OrderTabError(this.failure);
  
   }
