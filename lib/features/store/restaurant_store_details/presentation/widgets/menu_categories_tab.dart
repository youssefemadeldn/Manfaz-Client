import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../data/models/store_details_model.dart';

class MenuCategoriesTab extends StatelessWidget {
  final List<Categories> categories;
  final TabController tabController;
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const MenuCategoriesTab({
    Key? key,
    required this.categories,
    required this.tabController,
    required this.selectedIndex,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.only(bottom: 16.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onCategorySelected(index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    color: isSelected 
                        ? AppColors.primary.withOpacity(0.3) 
                        : Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                    spreadRadius: isSelected ? 1 : 0,
                  ),
                ],
                border: Border.all(
                  color: isSelected 
                      ? AppColors.primary 
                      : AppColors.divider,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Category Icon
                  Container(
                    width: 24.w,
                    height: 24.w,
                    margin: EdgeInsets.only(right: 8.w),
                    decoration: BoxDecoration(
                      color: isSelected 
                          ? Colors.white.withOpacity(0.2) 
                          : AppColors.background,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getCategoryIcon(categories[index].name),
                      color: isSelected 
                          ? Colors.white 
                          : AppColors.textSecondary,
                      size: 14.w,
                    ),
                  ),
                  
                  // Category Name
                  Text(
                    categories[index].name ?? 'Category',
                    style: isSelected
                        ? AppStyles.bodyTextBold.copyWith(
                            color: Colors.white,
                            fontSize: 14.sp,
                          )
                        : AppStyles.bodyText2.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 14.sp,
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  
  IconData _getCategoryIcon(String? categoryName) {
    if (categoryName == null) return Icons.restaurant;
    
    final name = categoryName.toLowerCase();
    
    if (name.contains('burger') || name.contains('sandwich')) {
      return Icons.lunch_dining;
    } else if (name.contains('pizza')) {
      return Icons.local_pizza;
    } else if (name.contains('drink') || name.contains('beverage')) {
      return Icons.local_drink;
    } else if (name.contains('dessert') || name.contains('sweet')) {
      return Icons.cake;
    } else if (name.contains('salad')) {
      return Icons.spa;
    } else if (name.contains('breakfast')) {
      return Icons.free_breakfast;
    } else if (name.contains('seafood') || name.contains('fish')) {
      return Icons.set_meal;
    } else if (name.contains('chicken') || name.contains('meat')) {
      return Icons.restaurant_menu;
    } else if (name.contains('appetizer') || name.contains('starter')) {
      return Icons.tapas;
    }
    
    return Icons.restaurant;
  }
}
