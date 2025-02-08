import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';

import '../widgets/menu_item.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            // Profile Section with Gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withOpacity(0.8),
                    AppColors.primary,
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 2),
                    ),
                    child: CircleAvatar(
                      radius: 35.r,
                      backgroundColor: AppColors.lightGrey,
                      child: Icon(Icons.person,
                          color: AppColors.white, size: 45.sp),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "profile_tab.name".tr(),
                        style: AppStyles.profileName
                            .copyWith(color: AppColors.white),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star_border,
                            color: AppColors.white,
                            size: 18.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          "profile_tab.not_verified".tr(),
                          style: AppStyles.profileStatus
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Wallet Card
            Container(
              margin: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    // offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "profile_tab.wallet".tr(),
                          style: AppStyles.listTileTitle.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          color: AppColors.primary,
                          size: 24.sp,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "profile_tab.balance".tr(),
                                      style: AppStyles.balanceText.copyWith(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      "profile_tab.delivery_balance".tr(),
                                      style: AppStyles.listTileSubtitle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 50.w),
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  height: 40.h,
                                  child: CusTextButton(
                                    buttonText: "profile_tab.add".tr(),
                                    onPressed: () {},
                                    backgroundColor: AppColors.primary,
                                    borderRadius: 8,
                                    horizontalPadding: 8,
                                    verticalPadding: 0,
                                  ),
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
            ),

            // Menu Items
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  MenuItem(
                    icon: Icons.directions_car,
                    title: "profile_tab.orders".tr(),
                    trailing: Text(
                      "profile_tab.orders_count".tr(),
                      style: AppStyles.listTileTitle
                          .copyWith(color: AppColors.primary,
                          fontSize: 14.sp,
                        fontWeight: FontWeight.w700,  
                          ),
                    ),
                  ),
                  Divider(height: 1, color: AppColors.divider),
                  MenuItem(
                    icon: Icons.location_on,
                    title: "profile_tab.saved_addresses".tr(),
                    trailing: Text(
                      "profile_tab.less_than".tr(args: ['1']),
                      style: AppStyles.listTileSubtitle
                          .copyWith(color: AppColors.primary,
                          fontSize: 14.sp,
                        fontWeight: FontWeight.w700,  
                          ),
                    ),
                  ),
                  Divider(height: 1, color: AppColors.divider),
                  MenuItem(
                    icon: Icons.star_border,
                    title: "profile_tab.ratings".tr(),
                    trailing: Text(
                      "profile_tab.less_than".tr(args: ['0']),
                      style: AppStyles.listTileSubtitle
                          .copyWith(color: AppColors.primary,
                          fontSize: 14.sp,
                        fontWeight: FontWeight.w700,  
                          ),
                    ),
                  ),
                  Divider(height: 1, color: AppColors.divider),
                  MenuItem(
                    icon: Icons.chat_bubble_outline,
                    title: "profile_tab.user_notes".tr(),
                    trailing: Text(
                      "profile_tab.less_than".tr(args: ['0']),
                      style: AppStyles.listTileSubtitle.copyWith(
                        color: AppColors.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,  
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // Add Coupon Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CusTextButton(
                buttonText: "profile_tab.add_coupon".tr(),
                onPressed: () {},
                backgroundColor: AppColors.primary,
                borderRadius: 8,
                horizontalPadding: 16,
                verticalPadding: 12,
                buttonWidth: double.infinity,
              ),
            ),

            SizedBox(height: 20.h),

            // Support and Corporate Section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  MenuItem(
                    icon: Icons.help_outline,
                    title: "profile_tab.customer_support".tr(),
                    showTrailingArrow: true,
                  ),
                  Divider(height: 1, color: AppColors.divider),
                  MenuItem(
                    icon: Icons.business_center_outlined,
                    title: "profile_tab.corporate_offers".tr(),
                    showTrailingArrow: true,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
