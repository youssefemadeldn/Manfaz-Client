import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';
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
              'Requests',
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
                      // Customize the appearance and behavior of the tab bar
                      backgroundColor: AppColors.primary,
                      borderWidth: 2,
                      // buttonMargin: EdgeInsets.zero,
                      borderColor: AppColors.primary,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedBackgroundColor: AppColors.white,
                      unselectedBorderColor: AppColors.lightGrey,
                      unselectedLabelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      // Add your tabs here
                      tabs: [
                        Tab(text: '  All  '),
                        Tab(text: 'Previous'),
                        Tab(text: 'Completed'),
                        Tab(text: 'Canceled'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          ListView.builder(
                            itemBuilder: (context, i) => OrderCardItem(),
                          ),
                          Center(child: Text('Content for Tab 2')),
                          Center(child: Text('Content for Tab 3')),
                          Center(child: Text('Content for Tab 4')),
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
