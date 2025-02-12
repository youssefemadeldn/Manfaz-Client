import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../widgets/DistanceLocation.dart';
import '../widgets/LogoOrganization.dart';

class DeliveryListViewView extends StatelessWidget {
  const DeliveryListViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.textSecondary),
            onPressed: () => Navigator.pop(context),
          ),
          title: _buildSearchBar(),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: ButtonsTabBar(
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
                tabs: [
                  Tab(
                    icon: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Icon(Icons.restaurant_menu),
                    ),
                    text: 'All',
                  ),
                  Tab(
                    icon: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Icon(Icons.lunch_dining),
                    ),
                    text: 'Burger',
                  ),
                  Tab(
                    icon: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Icon(Icons.coffee),
                    ),
                    text: 'Coffee',
                  ),
                  Tab(
                    icon: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Icon(Icons.breakfast_dining),
                    ),
                    text: 'Breakfast',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildDeliveryList('All'),
                  _buildDeliveryList('Burger'),
                  _buildDeliveryList('Coffee'),
                  _buildDeliveryList('Breakfast'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search in Food & Beverages',
          hintStyle: AppStyles.subtitle2.copyWith(color: AppColors.textHint),
          prefixIcon: Icon(Icons.search, color: AppColors.primary),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        ),
      ),
    );
  }

  Widget _buildDeliveryList(String category) {
    return ListView.builder(
      padding: EdgeInsets.all(16.r),
      itemCount: 10,
      itemBuilder: (context, index) => DeliveryCardItem(),
    );
  }
}

class DeliveryCardItem extends StatelessWidget {
  const DeliveryCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: Image.network(
                  'https://img.freepik.com/free-psd/special-delicious-food-social-media-banner-post-template_202595-499.jpg?t=st=1739083738~exp=1739087338~hmac=298a30ec11b5cc614ca4b92e74b45b4e1219dbf9782675e2c69f27e1b52f296d&w=740',
                  height: 180.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                // top: 16.h,
                right: 10.w,
                // left: 50.w,
                bottom: -60.h,
                child: DistanceLocation(),
              ),
              Positioned(
                bottom: -25.h,
                left: 16.w,
                child: LogoOrganization(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 35.h, 16.w, 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Restaurant Name',
                  style: AppStyles.subtitle1.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18.sp),
                    SizedBox(width: 4.w),
                    Text(
                      '4.5',
                      style: AppStyles.bodyText2.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '(200+ Ratings)',
                      style: AppStyles.bodyText2.copyWith(
                        color: AppColors.textHint,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.delivery_dining,
                        color: AppColors.primary,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Delivery 5 SAR',
                        style: AppStyles.bodyText2.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

