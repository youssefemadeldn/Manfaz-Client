import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/view/home_tab.dart';
import 'package:manfaz/features/tabs/notification_tab/presentation/view/notification_tab.dart';
import 'package:manfaz/features/order/orders_tab/presentation/view/orders_tab.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manfaz/features/tabs/profile_tab/presentation/view/profile_tab_refactored.dart';

class CusBottomNavigationBar extends StatefulWidget {
  const CusBottomNavigationBar({super.key});

  @override
  State<CusBottomNavigationBar> createState() => _CusBottomNavigationBarState();
}

class _CusBottomNavigationBarState extends State<CusBottomNavigationBar> {
  int selectedIndex = 0;

  final List<Widget> tabs = [
    HomeTab(),
    OrdersTab(),
    NotificationTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.darkGrey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        elevation: 4.h,
        currentIndex: selectedIndex,
        selectedIconTheme: IconThemeData(
          color: AppColors.primary,
          size: 28.h,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.darkGrey,
          size: 24.h,
        ),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/home.svg',
              height: 24.h,
              color:
                  selectedIndex == 0 ? AppColors.primary : AppColors.darkGrey,
            ),
            label: tr('bottom_nav.home'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/orders.svg',
              height: 24.h,
              color:
                  selectedIndex == 1 ? AppColors.primary : AppColors.darkGrey,
            ),
            label: tr('bottom_nav.orders'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/Notification.svg',
              height: 24.h,
              color:
                  selectedIndex == 2 ? AppColors.primary : AppColors.darkGrey,
            ),
            label: tr('bottom_nav.notification'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/profile.svg',
              height: 24.h,
              color:
                  selectedIndex == 3 ? AppColors.primary : AppColors.darkGrey,
            ),
            label: tr('bottom_nav.profile'),
          ),
        ],
      ),
    );
  }
}
