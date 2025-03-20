import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../data/models/store_details_model.dart';

class MenuCategoriesTab extends StatelessWidget {
  final List<Categories> categories;
  final Function(int) onCategorySelected;
  final TabController controller;
  
  const MenuCategoriesTab({
    super.key,
    required this.categories,
    required this.onCategorySelected,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: ButtonsTabBar(
        controller: controller,
        backgroundColor: AppColors.primary,
        unselectedBackgroundColor: Colors.white,
        labelStyle: AppStyles.subtitle2.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppStyles.subtitle2.copyWith(
          color: AppColors.textSecondary,
        ),
        borderWidth: 1,
        borderColor: AppColors.primary,
        unselectedBorderColor: AppColors.primary.withOpacity(0.3),
        radius: 100,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        height: 45.h,
        onTap: onCategorySelected,
        tabs: categories.map((category) => 
          Tab(
            text: category.name ?? 'Category',
          )
        ).toList(),
      ),
    );
  }
}
