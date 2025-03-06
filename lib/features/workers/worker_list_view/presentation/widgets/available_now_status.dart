import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class AvailableNowStatus extends StatelessWidget {
  final bool availableNow;
  const AvailableNowStatus({
    super.key,
    required this.availableNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: availableNow? AppColors.accentGreen.withOpacity(0.2) :AppColors.red.withOpacity(0.2) ,
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
           availableNow? 'Available Now' : 'Not Available',
            style: AppStyles.caption.copyWith(
              color: availableNow? AppColors.accentGreen : AppColors.red,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
