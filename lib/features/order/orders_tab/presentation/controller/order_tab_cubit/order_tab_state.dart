part of 'order_tab_cubit.dart';

@immutable
sealed class OrderTabState {}

class OrderTabInitial extends OrderTabState {}

class OrderTabLoading extends OrderTabState {}

class OrderTabSuccess extends OrderTabState {
  final List<Order> allOrders;
  final List<Order> pendingOrders;
  final List<Order> inProgressOrders;
  final List<Order> completedOrders;
  final List<Order> canceledOrders;

  OrderTabSuccess({
    required this.allOrders,
    required this.pendingOrders,
    required this.inProgressOrders,
    required this.completedOrders,
    required this.canceledOrders,
  });
}

class OrderTabError extends OrderTabState {
  final Failure failure;

  OrderTabError(this.failure);
}
