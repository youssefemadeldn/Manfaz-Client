import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manfaz/core/routes/routes.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5.r),
          bottomRight: Radius.circular(5.r),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr('home.location'),
              style: AppStyles.bodyText1.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.white,
                ),
                SizedBox(
                  width: 5.w,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  tr('home.city_country'),
                  style: AppStyles.bodyText2.copyWith(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(
                        context, Routes.getUserLocationView);
                  },
                  icon: SvgPicture.asset(
                    'assets/svg/arrow_down.svg',
                    color: AppColors.white,
                  ),
                  color: AppColors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('home.greeting'),
                  style: AppStyles.header1.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            // Search Text Field
            TextField(
              decoration: InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.darkGrey,
                  size: 30.h,
                  weight: 400,
                ),
                hintText: tr('home.search_hint'),
                hintStyle: AppStyles.bodyText2,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
