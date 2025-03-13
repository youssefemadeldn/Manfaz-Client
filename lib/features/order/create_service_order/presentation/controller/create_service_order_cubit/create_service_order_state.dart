part of 'create_service_order_cubit.dart';

@immutable
sealed class CreateServiceOrderState {}

final class CreateServiceOrderInitial extends CreateServiceOrderState {}

final class CreateServiceOrderLoading extends CreateServiceOrderState {}

final class CreateServiceOrderSuccess extends CreateServiceOrderState {
  final CreateServiceOrderModel createServiceOrderModel;
  CreateServiceOrderSuccess({required this.createServiceOrderModel});
}

final class CreateServiceOrderFailure extends CreateServiceOrderState {
  final Failure failure;
  CreateServiceOrderFailure({required this.failure});
}

final class LocationSelected extends CreateServiceOrderState {
  final Map<String, dynamic> location;
  LocationSelected({required this.location});
}

final class PaymentMethodSelected extends CreateServiceOrderState {
  final String paymentMethod;
  PaymentMethodSelected({required this.paymentMethod});
}
