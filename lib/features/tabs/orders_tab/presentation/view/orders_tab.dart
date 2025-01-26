import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/tabs/orders_tab/presentation/widgets/order_card_item.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr('orders_tab.requests'), // Localized "Requests"
              style: AppStyles.header2,
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: DefaultTabController(
                length: 4,
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
                        Tab(text: tr('orders_tab.all')), // Localized "All"
                        Tab(
                            text: tr(
                                'orders_tab.previous')), // Localized "Previous"
                        Tab(
                            text: tr(
                                'orders_tab.completed')), // Localized "Completed"
                        Tab(
                            text: tr(
                                'orders_tab.canceled')), // Localized "Canceled"
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          ListView.builder(
                            itemBuilder: (context, i) => const OrderCardItem(),
                          ),
                          Center(child: Text(tr('orders_tab.previous'))),
                          Center(child: Text(tr('orders_tab.completed'))),
                          Center(child: Text(tr('orders_tab.canceled'))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
