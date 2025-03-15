import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../widgets/DistanceLocation.dart';
import '../widgets/LogoOrganization.dart';
import '../../data/models/store_list_model.dart';

class RestaurantStoreView extends StatelessWidget {
  final List<Stores>? stores;

  const RestaurantStoreView({super.key, this.stores});

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
      itemCount: stores?.length ?? 0,
      itemBuilder: (context, index) => DeliveryCardItem(
        store: stores?[index],
      ),
    );
  }
}

class DeliveryCardItem extends StatelessWidget {
  final Stores? store;

  const DeliveryCardItem({super.key, this.store});

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
                  store?.coverImage ?? 'https://via.placeholder.com/400x200',
                  height: 180.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (store?.locations != null && store!.locations!.isNotEmpty)
                Positioned(
                  right: 10.w,
                  bottom: -60.h,
                  child: DistanceLocation(),
                ),
              Positioned(
                bottom: -25.h,
                left: 16.w,
                child: LogoOrganization(logoUrl: store?.logo),
              ),
              // Status Badge
              if (store?.status != null)
                Positioned(
                  top: 16.h,
                  right: 16.w,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color:
                          store?.status == 'OPEN' ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Text(
                      store?.status ?? '',
                      style: AppStyles.caption.copyWith(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 35.h, 16.w, 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            store?.name ?? 'Restaurant Name',
                            style: AppStyles.subtitle1.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (store?.category != null)
                            Text(
                              store?.category?.name ?? '',
                              style: AppStyles.caption.copyWith(
                                color: AppColors.textHint,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (store?.minOrderAmount != null)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          'Min. ${store?.minOrderAmount} SAR',
                          style: AppStyles.caption.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18.sp),
                    SizedBox(width: 4.w),
                    Text(
                      '${store?.rating ?? 0}',
                      style: AppStyles.bodyText2.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '(${store?.reviewsCount ?? 0}+ Ratings)',
                      style: AppStyles.bodyText2.copyWith(
                        color: AppColors.textHint,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                            'Delivery ${store?.deliveryFee ?? 0} SAR',
                            style: AppStyles.bodyText2.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    if (store?.workingHours != null &&
                        store!.workingHours!.isNotEmpty)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.access_time,
                              color: AppColors.primary,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              '${store?.workingHours?[0].openTime?.substring(0, 5)} - ${store?.workingHours?[0].closeTime?.substring(0, 5)}',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
