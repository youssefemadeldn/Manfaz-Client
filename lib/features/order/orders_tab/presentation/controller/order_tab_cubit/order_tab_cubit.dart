import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart' as di;
import 'package:meta/meta.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/utils/order_date_formatter.dart';
import '../../../data/models/orders_list_model.dart';
import '../../../domain/use_cases/get_orders_tab_use_case.dart';


part 'order_tab_state.dart';

@di.injectable
class OrderTabCubit extends Cubit<OrderTabState> {
  final GetOrdersTabUseCase getOrdersTabUseCase;
  OrderTabCubit(this.getOrdersTabUseCase) : super(OrderTabInitial());

  Future<void> getOrdersTabData() async {
    emit(OrderTabLoading());
    final result = await getOrdersTabUseCase.call();
    result.fold(
      (failure) => emit(OrderTabError(failure)),
      (ordersList) {
        final orders = ordersList.data?.orders ?? [];
        emit(OrderTabSuccess(
          allOrders: orders,
          pendingOrders: _filterOrders(orders, 'pending'),
          inProgressOrders: _filterOrders(orders, 'in progress'),
          completedOrders: _filterOrders(orders, 'completed'),
          canceledOrders: _filterOrders(orders, 'canceled'),
        ));
      },
    );
  }

  List<Order> _filterOrders(List<Order> orders, String status) {
    return orders
        .where((order) => order.status?.toLowerCase() == status.toLowerCase())
        .toList();
  }

  String formatDate(String date) {
    return DateFormatter.formatDate(date);
  }
}
