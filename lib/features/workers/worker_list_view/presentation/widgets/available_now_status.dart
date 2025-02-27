import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class AvailableNowStatus extends StatelessWidget {
  const AvailableNowStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.accentGreen.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            color: AppColors.accentGreen,
            size: 8.w,
          ),
          SizedBox(width: 4.w),
          Text(
            'Available Now',
            style: AppStyles.caption.copyWith(
              color: AppColors.accentGreen,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
