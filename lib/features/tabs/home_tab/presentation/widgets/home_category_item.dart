import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';

import '../../../../../core/theme/app_styles.dart';

class HomeCategoryItem extends StatelessWidget {
  final String title;

  final String image;
  const HomeCategoryItem({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.peopleListViewView);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(
                color: AppColors.lightGrey,
                width: 1.w,
              ),
            ),
            elevation: 1,
            color: AppColors.background,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Image.asset(image, height: 50.h, width: 50.w),
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            title,
            style: AppStyles.bodyText2.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}


/*
 Padding(
              padding: EdgeInsets.only(top: 8.h, left: 8.w, right: 8.w),
              child: Text(
                overflow: TextOverflow.ellipsis,
                title,
                style: TextStyle(color: Colors.black),
              ),
            ),
*/