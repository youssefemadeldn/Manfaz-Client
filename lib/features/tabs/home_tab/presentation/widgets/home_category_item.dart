import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';

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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 70.h,
            child: Container(
              alignment: Alignment.center,
              width: 70.w,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: AppColors.background,
                  width: 1.w,
                ),
              ),
              child: Image.asset(
                image,
                height: double.infinity,
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1, // Ensure text fits in one line
            style: AppStyles.bodyText2.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
