import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';

class OrdersTabBar extends StatelessWidget {
  const OrdersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonsTabBar(
      backgroundColor: Colors.transparent,
      borderWidth: 2,
      borderColor: AppColors.primary,
      labelStyle: TextStyle(
        color: AppColors.primary,
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
        Tab(text: tr('orders_tab.pending')),
        Tab(text: tr('orders_tab.in_progress')),
        Tab(text: tr('orders_tab.completed')),
        Tab(text: tr('orders_tab.canceled')),
      ],
    );
  }
}
