import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:manfaz/core/cache/shared_pref_utils.dart';
import 'package:manfaz/core/helper/bottom_sheet_helper.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';
import 'package:manfaz/features/tabs/profile_tab/data/models/get_user_profile_model.dart';
import 'package:manfaz/features/tabs/profile_tab/presentation/widgets/saved_addresses_bottom_sheet.dart';

import '../../../../../core/routes/routes.dart';
import '../widgets/menu_item.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  // Mock user profile data
  final Data mockUserProfile = Data(
    name: "Ahmed Mohamed",
    email: "ahmed.mohamed@example.com",
    phone: "+20 123 456 7890",
    imageUrl: "https://randomuser.me/api/portraits/men/32.jpg",
    isVerified: true,
    totalOrders: 12,
    totalReviews: 8,
    totalEarnings: 1500,
    wallet: [
      Wallet(
        balance: 350.0,
        transactions: [
          Transaction(
            type: "deposit",
            amount: 100.0,
            status: "completed",
            createdAt: "2025-03-20T10:30:00Z",
          ),
          Transaction(
            type: "withdrawal",
            amount: 50.0,
            status: "completed",
            createdAt: "2025-03-22T14:15:00Z",
          ),
        ],
      ),
    ],
    locations: [
      UserLocation(
        name: "Home",
        address: "123 Main St",
        area: "Downtown",
        city: "Cairo",
        isDefault: true,
      ),
      UserLocation(
        name: "Work",
        address: "456 Office Tower",
        area: "Business District",
        city: "Cairo",
        isDefault: false,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            // Profile Section with Gradient
            _buildProfileHeader(context),
            
            // Stats Section
            _buildStatsSection(context),

            // Wallet Card
            _buildWalletCard(context),

            // Menu Items
            _buildMenuItems(context),

            SizedBox(height: 20.h),

            // Add Coupon Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButton(
                onPressed: () {},
                backgroundColor: AppColors.primary,
                borderRadius: 8,
                horizontalPadding: 16,
                verticalPadding: 12,
                buttonWidth: double.infinity,
                child: Text(
                  "profile_tab.add_coupon".tr(),
                  style: AppStyles.buttonText,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // Support and Corporate Section
            _buildSupportSection(context),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
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
            child: mockUserProfile.imageUrl != null && mockUserProfile.imageUrl!.isNotEmpty
                ? CircleAvatar(
                    radius: 35.r,
                    backgroundColor: AppColors.lightGrey,
                    backgroundImage: CachedNetworkImageProvider(
                      mockUserProfile.imageUrl!,
                    ),
                  )
                : CircleAvatar(
                    radius: 35.r,
                    backgroundColor: AppColors.lightGrey,
                    child: Icon(Icons.person, color: AppColors.white, size: 45.sp),
                  ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mockUserProfile.name ?? "profile_tab.name".tr(),
                  style: AppStyles.profileName.copyWith(color: AppColors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Text(
                  mockUserProfile.email ?? "",
                  style: AppStyles.listTileSubtitle.copyWith(color: AppColors.white.withOpacity(0.9)),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Text(
                  mockUserProfile.phone ?? "",
                  style: AppStyles.listTileSubtitle.copyWith(color: AppColors.white.withOpacity(0.9)),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: mockUserProfile.isVerified == true
                        ? Colors.white.withOpacity(0.2)
                        : AppColors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    mockUserProfile.isVerified == true
                        ? "profile_tab.verified".tr()
                        : "profile_tab.not_verified".tr(),
                    style: AppStyles.profileStatus.copyWith(
                      color: mockUserProfile.isVerified == true
                          ? Colors.white
                          : AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      padding: EdgeInsets.symmetric(vertical: 15.h),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(
            context,
            "profile_tab.orders".tr(),
            mockUserProfile.totalOrders?.toString() ?? "0",
            Icons.shopping_bag_outlined,
          ),
          _buildVerticalDivider(),
          _buildStatItem(
            context,
            "profile_tab.reviews".tr(),
            mockUserProfile.totalReviews?.toString() ?? "0",
            Icons.star_outline,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 24.sp),
        SizedBox(height: 8.h),
        Text(
          value,
          style: AppStyles.listTileTitle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          title,
          style: AppStyles.listTileSubtitle.copyWith(
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 40.h,
      width: 1,
      color: AppColors.divider,
    );
  }

  Widget _buildWalletCard(BuildContext context) {
    final wallet = mockUserProfile.wallet?.isNotEmpty == true ? mockUserProfile.wallet!.first : null;
    final balance = wallet?.balance ?? 0.0;
    
    return Container(
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$${balance.toStringAsFixed(2)}",
                              style: AppStyles.balanceText.copyWith(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "profile_tab.current_balance".tr(),
                              style: AppStyles.listTileSubtitle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 40.h,
                          child: CustomButton(
                            onPressed: () {},
                            backgroundColor: AppColors.primary,
                            borderRadius: 8,
                            horizontalPadding: 8,
                            verticalPadding: 0,
                            child: Text(
                              "profile_tab.add".tr(),
                              style: AppStyles.buttonText,
                            ),
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
    );
  }
  Widget _buildMenuItems(BuildContext context) {
    return Container(
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
              "${mockUserProfile.totalOrders ?? 0}",
              style: AppStyles.listTileTitle.copyWith(
                color: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Divider(height: 1, color: AppColors.divider),
          InkWell(
            onTap: () {
              BottomSheetHelper.show(
                context: context, 
                child: SavedAddressesBottomSheet(
                  locations: mockUserProfile.locations,
                ),
              );
            },
            child: MenuItem(
              icon: Icons.location_on,
              title: "profile_tab.saved_addresses".tr(),
              trailing: Text(
                "${mockUserProfile.locations?.length ?? 0}",
                style: AppStyles.listTileSubtitle.copyWith(
                  color: AppColors.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Divider(height: 1, color: AppColors.divider),
          MenuItem(
            icon: Icons.star_border,
            title: "profile_tab.ratings".tr(),
            trailing: Text(
              "${mockUserProfile.totalReviews ?? 0}",
              style: AppStyles.listTileSubtitle.copyWith(
                color: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Divider(height: 1, color: AppColors.divider),
          // MenuItem(
          //   icon: Icons.edit_note,
          //   title: "profile_tab.edit_profile".tr(),
          //   showTrailingArrow: true,
          // ),
        ],
      ),
    );
  }

  Widget _buildSupportSection(BuildContext context) {
    return Container(
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
          // MenuItem(
          //   icon: Icons.help_outline,
          //   title: "profile_tab.customer_support".tr(),
          //   showTrailingArrow: true,
          // ),
          // Divider(height: 1, color: AppColors.divider),
          // MenuItem(
          //   icon: Icons.business_center_outlined,
          //   title: "profile_tab.corporate_offers".tr(),
          //   showTrailingArrow: true,
          // ),
          // Divider(height: 1, color: AppColors.divider),
          InkWell(
            onTap: () => Navigator.pushNamed(context, Routes.settingsView),
            child: MenuItem(
              icon: Icons.settings_outlined,
              title: "profile_tab.settings".tr(),
              showTrailingArrow: true,
            ),
          ),
          Divider(height: 1, color: AppColors.divider),
          MenuItem(
            onTap: () async {
              await SharedPrefUtils.removeData('hasLoggedIn');
              Navigator.pushReplacementNamed(context, Routes.loginView);
            },
            icon: Icons.logout,
            title: "profile_tab.logout".tr(),
            showTrailingArrow: true,
          ),
        ],
      ),
    );
  }
}
