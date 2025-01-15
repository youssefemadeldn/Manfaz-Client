import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:manfaz/core/theme/app_colors.dart';

class CusBottomNavigationBar extends StatelessWidget {
  const CusBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
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
          // Handle button tap
        },
      ),
    );
  }
}
