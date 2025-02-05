import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/theme/app_colors.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            // Profile Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.lightGrey,
                    child: Icon(Icons.person, color: AppColors.white, size: 40.sp),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "profile_tab.name".tr(),
                        style: AppStyles.profileName,
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star_border,
                            color: AppColors.grey,
                            size: 18.sp,
                          ),
                        ),
                      ),
                      Text(
                        "profile_tab.not_verified".tr(),
                        style: AppStyles.profileStatus,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),

            // Wallet Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "profile_tab.wallet".tr(),
                        style: AppStyles.listTileTitle,
                      ),
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: AppColors.grey,
                        size: 24.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        "profile_tab.balance".tr(),
                        style: AppStyles.balanceText,
                      ),
                      Spacer(),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.add, color: AppColors.white, size: 20.sp),
                        label: Text(
                          "profile_tab.add".tr(),
                          style: AppStyles.buttonText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Divider(color: AppColors.divider),
                  ListTile(
                    title: Text(
                      "profile_tab.delivery_balance".tr(),
                      style: AppStyles.listTileTitle,
                    ),
                    subtitle: Text(
                      "profile_tab.balance".tr(),
                      style: AppStyles.listTileSubtitle,
                    ),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Text("profile_tab.new".tr(),
                          style: AppStyles.badgeText),
                    ),
                  ),
                  Divider(color: AppColors.divider),
                  ListTile(
                    leading: Icon(Icons.directions_car, color: AppColors.grey, size: 24.sp),
                    title: Text(
                      "profile_tab.orders".tr(),
                      style: AppStyles.listTileTitle,
                    ),
                    trailing: Text(
                      "profile_tab.orders_count".tr(),
                      style: AppStyles.listTileTitle.copyWith(color: AppColors.primary),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: AppColors.grey, size: 24.sp),
                    title: Text(
                      "profile_tab.saved_addresses".tr(),
                      style: AppStyles.listTileTitle,
                    ),
                    trailing: Text(
                      "profile_tab.less_than".tr(args: ['1']),
                      style: AppStyles.listTileSubtitle.copyWith(color: AppColors.primary),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.star_border, color: AppColors.grey, size: 24.sp),
                    title: Text(
                      "profile_tab.ratings".tr(),
                      style: AppStyles.listTileTitle,
                    ),
                    trailing: Text(
                      "profile_tab.less_than".tr(args: ['0']),
                      style: AppStyles.listTileSubtitle.copyWith(color: AppColors.primary),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.chat_bubble_outline, color: AppColors.grey, size: 24.sp),
                    title: Text(
                      "profile_tab.user_notes".tr(),
                      style: AppStyles.listTileTitle,
                    ),
                    trailing: Text(
                      "profile_tab.less_than".tr(args: ['0']),
                      style: AppStyles.listTileSubtitle.copyWith(color: AppColors.primary),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.add, color: AppColors.white, size: 20.sp),
                    label: Text(
                      "profile_tab.add_coupon".tr(),
                      style: AppStyles.buttonText,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Divider(color: AppColors.divider),
                  ListTile(
                    title: Text(
                      "profile_tab.customer_support".tr(),
                      style: AppStyles.listTileTitle,
                    ),
                    trailing: Icon(Icons.help_outline, color: AppColors.grey, size: 24.sp),
                  ),
                  ListTile(
                    title: Text(
                      "profile_tab.corporate_offers".tr(),
                      style: AppStyles.listTileTitle,
                    ),
                    trailing: Icon(Icons.business_center_outlined, color: AppColors.grey, size: 24.sp),
                  ),
                  ListTile(
                    title: Text(
                      "profile_tab.settings".tr(),
                      style: AppStyles.listTileTitle,
                    ),
                    trailing: Icon(Icons.settings, color: AppColors.grey, size: 24.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
