import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class ServiceCardItem extends StatelessWidget {
  final String title;
  final String supTitle;
  final String image;
  final String price;
  final VoidCallback onTap;

  const ServiceCardItem({
    super.key,
    required this.title,
    required this.supTitle,
    required this.image,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // width: 190.w,
        // height: 200.h,
        // margin: EdgeInsets.all(8.r),
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 140.w,
              height: 100.h,
            ),
            Text(
              title,
              style: AppStyles.header3.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              supTitle,
              style: AppStyles.bodyText1.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              padding: EdgeInsets.all(3.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.primary.withValues(alpha: .9),
              ),
              // alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                price,
                style: AppStyles.bodyText3.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}
