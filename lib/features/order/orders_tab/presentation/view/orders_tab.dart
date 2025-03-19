import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/order/orders_tab/data/models/orders_list_model.dart';
import 'package:manfaz/features/order/orders_tab/presentation/widgets/order_card_item.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/widgets/error_message_widget.dart';
import '../controller/order_tab_cubit/order_tab_cubit.dart';

class OrdersTab extends StatelessWidget {
   List<Order> orders;

   OrdersTab({
    super.key,
    this.orders = const [], // Default to empty list
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrderTabCubit>()..getOrdersTabData(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr('orders_tab.requests'),
                style: AppStyles.header2,
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: DefaultTabController(
                  length: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ButtonsTabBar(
                        backgroundColor: AppColors.primary,
                        borderWidth: 2,
                        borderColor: AppColors.primary,
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedBackgroundColor: AppColors.white,
                        unselectedBorderColor: AppColors.lightGrey,
                        unselectedLabelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        tabs: [
                          Tab(text: tr('orders_tab.all')),
                          Tab(text: "Pending"),
                          Tab(text: "In Progress"),
                          Tab(text: tr('orders_tab.completed')),
                          Tab(text: tr('orders_tab.canceled')),
                        ],
                      ),
                      BlocBuilder<OrderTabCubit, OrderTabState>(
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
                             orders = state.ordersList.data?.orders ?? [];
                            return Expanded(
                              child: TabBarView(
                                children: <Widget>[
                                  _buildOrdersList(orders),
                                  _buildOrdersList(_filterOrders('pending')),
                                  _buildOrdersList(
                                      _filterOrders('in progress')),
                                  _buildOrdersList(_filterOrders('completed')),
                                  _buildOrdersList(_filterOrders('canceled')),
                                ],
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrdersList(List<Order> filteredOrders) {
    if (filteredOrders.isEmpty) {
      return Center(
        child: Text(tr('orders_tab.no_orders')),
      );
    }

    return ListView.builder(
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) => OrderCardItem(
        order: filteredOrders[index],
      ),
    );
  }

  List<Order> _filterOrders(String status) {
    return orders
        .where((order) => order.status?.toLowerCase() == status.toLowerCase())
        .toList();
  }
}
