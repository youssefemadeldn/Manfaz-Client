import 'package:easy_localization/easy_localization.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'restaurant_store_details.menu.categories'.tr(),
            style: AppStyles.subtitle2,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          height: 50.h,
          margin: EdgeInsets.only(bottom: 16.h),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () => onCategorySelected(index),
                child: Container(
                  margin: EdgeInsets.only(right: 12.w),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : Colors.white,
                      borderRadius: BorderRadius.circular(25.r),
                      boxShadow: [
                        BoxShadow(
                          color: isSelected 
                            ? AppColors.primary.withOpacity(0.3)
                            : Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _getCategoryIcon(category.name),
                          color: isSelected ? Colors.white : AppColors.grey,
                          size: 20.w,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          category.name ?? '',
                          style: AppStyles.subtitle2.copyWith(
                            color: isSelected ? Colors.white : AppColors.textPrimary,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
