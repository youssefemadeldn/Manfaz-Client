import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/home_category_item.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/service_card_item.dart';

import '../../../../../core/helper/bottom_sheet_helper.dart';
import '../widgets/home_bottom_sheet_child_widget.dart';
import '../widgets/home_search_bar_widget.dart';

import 'package:easy_localization/easy_localization.dart';
import '../widgets/quick_action_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Enhanced Search Bar with Location
          Container(
            // padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
            child: Column(
              children: [
                HomeSearchBarWidget(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(Icons.location_on, color: AppColors.primary),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        tr('home.delivery_location'),
                        style: AppStyles.bodyText2.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Main Services Section
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Quick Actions
                Text(
                  tr('home.quick_actions'),
                  style: AppStyles.header1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 16.h),
           
                SizedBox(
                  height: 100.h,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                    //   QuickActionItem(
                    //     icon: Icons.home_repair_service,
                    //     label: tr('home.services'),
                    //     color: Colors.orange,
                    //     onTap: () {
                    //       // Handle services section
                    //     },
                    //   ),
                    //   SizedBox(
                    //     width: 20.w,
                    //   ),
                    //     QuickActionItem(
                    //   icon: Icons.delivery_dining,
                    //   label: tr('home.delivery'),
                    //   color: AppColors.primary,
                    //   onTap: () {
                    //     // Handle delivery section
                    //   },
                    // ),
                    //   SizedBox(
                    //     width: 20.w,
                    //   ),
                        QuickActionItem(
                      icon: Icons.engineering,
                      label: tr('home.not_available_service'),
                      color: AppColors.green,
                      onTap: () {
                        // Handle delivery section
                      },
                    ),
                    ],
                  ),
                ),
                
                SizedBox(height: 24.h),
                
                // Popular Services
                Text(
                  tr('home.popular_services'),
                  style: AppStyles.header1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: ServiceCardItem(
                        image: 'assets/images/food_and_drinks-removebg-preview.png',
                        title: _getPopularServiceTitle(index),
                        supTitle: _getPopularServiceSubtitle(index),
                        price: tr('home.price_range'),
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 24.h),
                
                // Categories Grid
                Text(
                  tr('home.all_categories'),
                  style: AppStyles.header1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 16.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) => HomeCategoryItem(
                    onTap: () {
                      BottomSheetHelper.show(
                        context: context,
                        maxHeight: 280.h,
                        child: HomeBottomSheetChildWidget(),
                      );
                    },
                    title: _getCategoryTitle(index),
                    image: _getCategoryImage(index),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getPopularServiceTitle(int index) {
    switch (index) {
      case 0:
        return tr('home.food_delivery');
      case 1:
        return tr('home.home_cleaning');
      case 2:
        return tr('home.ac_repair');
      case 3:
        return tr('home.plumbing');
      case 4:
        return tr('home.grocery');
      default:
        return '';
    }
  }

  String _getPopularServiceSubtitle(int index) {
    switch (index) {
      case 0:
        return tr('home.restaurants_cafes');
      case 1:
        return tr('home.professional_cleaning');
      case 2:
        return tr('home.ac_maintenance');
      case 3:
        return tr('home.plumbing_services');
      case 4:
        return tr('home.supermarket_delivery');
      default:
        return '';
    }
  }

  String _getCategoryTitle(int index) {
    switch (index) {
      case 0:
        return tr('home.food');
      case 1:
        return tr('home.maintenance');
      case 2:
        return tr('home.cleaning');
      case 3:
        return tr('home.grocery');
      case 4:
        return tr('home.laundry');
      case 5:
        return tr('home.electronics');
      case 6:
        return tr('home.pharmacy');
      case 7:
        return tr('home.more');
      default:
        return '';
    }
  }

  String _getCategoryImage(int index) {
    // Replace with actual image assets
    return 'assets/images/food_and_drinks-removebg-preview.png';
  }
}
