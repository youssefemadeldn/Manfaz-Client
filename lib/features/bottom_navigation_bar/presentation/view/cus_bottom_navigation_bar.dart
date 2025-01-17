import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/view/home_tab.dart';
import 'package:manfaz/features/tabs/notification_tab/presentation/view/notification_tab.dart';
import 'package:manfaz/features/tabs/profile_tab/presentation/view/profile_tab.dart';
import 'package:manfaz/features/tabs/requests_tab/presentation/view/requests_tab.dart';

class CusBottomNavigationBar extends StatefulWidget {
  const CusBottomNavigationBar({super.key});

  @override
  State<CusBottomNavigationBar> createState() => _CusBottomNavigationBarState();
}

class _CusBottomNavigationBarState extends State<CusBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        letIndexChange: (value) {
          return true;
        },
        backgroundColor: AppColors.black,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.storefront_outlined),
            label: 'ٌRequests',
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.notifications_none_rounded,
              size: 30.sp,
            ),
            label: 'Notification',
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.person_outline_rounded,
              size: 30.sp,
            ),
            label: 'profile',
          ),
        ],
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }

  List<Widget> tabs = [
    HomeTab(),
    RequestsTab(),
    NotificationTab(),
    ProfileTab(),
  ];
}
