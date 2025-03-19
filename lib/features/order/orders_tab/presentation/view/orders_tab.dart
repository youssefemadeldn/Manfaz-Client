import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/di.dart';
import '../../data/models/orders_list_model.dart';
import '../controller/order_tab_cubit/order_tab_cubit.dart';
import '../widgets/content/orders_tab_content.dart';
import '../widgets/header/orders_tab_header.dart';
import '../widgets/tab_bar/orders_tab_bar.dart';

// ignore: must_be_immutable
class OrdersTab extends StatelessWidget {
  List<Order> orders;

  OrdersTab({
    super.key,
    this.orders = const [],
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
              const OrdersTabHeader(),
              Expanded(
                child: DefaultTabController(
                  length: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      OrdersTabBar(),
                      OrdersTabContent(),
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
}
