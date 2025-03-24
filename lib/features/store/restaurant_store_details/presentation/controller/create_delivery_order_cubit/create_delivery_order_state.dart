part of 'create_delivery_order_cubit.dart';

@immutable
sealed class CreateDeliveryOrderState {}

final class CreateDeliveryOrderInitial extends CreateDeliveryOrderState {}
final class CreateDeliveryOrderLoading extends CreateDeliveryOrderState {}
final class CreateDeliveryOrderSuccess extends CreateDeliveryOrderState {
  final CreateDeliveryOrderModel createDeliveryOrderModel;
  CreateDeliveryOrderSuccess({required this.createDeliveryOrderModel});
}
final class CreateDeliveryOrderError extends CreateDeliveryOrderState {
  final Failure failure;
  CreateDeliveryOrderError({required this.failure});
}

final class DeliveryLocationSelected extends CreateDeliveryOrderState {
  final Map<String, dynamic> location;

  DeliveryLocationSelected(this.location);
}
