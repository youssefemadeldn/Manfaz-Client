
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class MenuItem extends StatelessWidget {
  

  final IconData icon;
  final String title;
  final Widget? trailing;
  final bool showTrailingArrow;
  const MenuItem({
    required this.icon,
    required this.title,
    this.trailing,
    this.showTrailingArrow = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: AppColors.primary, size: 24.sp),
      ),
      title: Text(
        title,
        style: AppStyles.listTileTitle.copyWith(fontWeight: FontWeight.w600),
      ),
      trailing: showTrailingArrow
          ? Icon(Icons.arrow_forward_ios, color: AppColors.grey, size: 16.sp)
          : trailing,
    );
  }
}