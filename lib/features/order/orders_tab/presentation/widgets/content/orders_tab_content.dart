import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/error_message_widget.dart';
import '../../../data/models/orders_list_model.dart';
import '../../controller/order_tab_cubit/order_tab_cubit.dart';
import '../order_card_item.dart';

class OrdersTabContent extends StatelessWidget {
  const OrdersTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderTabCubit, OrderTabState>(
      builder: (context, state) {
        if (state is OrderTabLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else if (state is OrderTabError) {
          return ErrorMessageWidget(
            errorMessage: state.failure.errorMessage,
          );
        } else if (state is OrderTabSuccess) {
          return Expanded(
            child: TabBarView(
              children: <Widget>[
                _buildOrdersList(state.allOrders),
                _buildOrdersList(state.pendingOrders),
                _buildOrdersList(state.inProgressOrders),
                _buildOrdersList(state.completedOrders),
                _buildOrdersList(state.canceledOrders),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildOrdersList(List<Order> orders) {
    if (orders.isEmpty) {
      return Center(
        child: Text(tr('orders_tab.no_orders')),
      );
    }

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) => OrderCardItem(
        order: orders[index],
      ),
    );
  }
}
