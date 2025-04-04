import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:manfaz/core/cache/shared_pref_utils.dart';
import 'package:manfaz/core/di/di.dart';
import 'package:manfaz/core/helper/bottom_sheet_helper.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';
import 'package:manfaz/core/widgets/error_message_widget.dart';
import 'package:manfaz/features/tabs/profile_tab/data/models/get_user_profile_model.dart';
import 'package:manfaz/features/tabs/profile_tab/presentation/widgets/saved_addresses_bottom_sheet.dart';

import '../../../../../core/routes/routes.dart';
import '../controller/profile_tab_cubit/profile_tab_cubit.dart';
import '../widgets/menu_item.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: BlocProvider(
          create: (context) =>
              getIt<ProfileTabCubit>()..getUserProfileById(),
          child: BlocBuilder<ProfileTabCubit, ProfileTabState>(
            builder: (context, state) {
              if (state is ProfileTabLoading) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(child: CircularProgressIndicator(
                    color: AppColors.primary,
                  )),
                );
              } else if (state is ProfileTabError) {
                return ErrorMessageWidget(errorMessage: state.failure.errorMessage);
              } else if(state is ProfileTabSuccess) {
                final userProfile = state.getUserProfile.data;
                
                if (userProfile == null) {
                  return ErrorMessageWidget(errorMessage: 'profile_tab.no_data'.tr());
                }
                
                return Column(
                  children: [
                    // Profile Section with Gradient
                    _buildProfileHeader(context, userProfile),

                    // Stats Section
                    _buildStatsSection(context, userProfile),

                    // Wallet Card
                    _buildWalletCard(context, userProfile),

                    // Menu Items
                    _buildMenuItems(context, userProfile),

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

                    // Support Section
                    _buildSupportSection(context),

                    SizedBox(height: 20.h),
                  ],
                );
              }
              
              // Default state (initial)
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text('profile_tab.loading'.tr()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, Data userProfile) {
    return Container(
      height: 220.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background design elements
          Positioned(
            top: -30,
            right: -30,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: -20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          
          // Profile content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile image
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.r),
                    child: CachedNetworkImage(
                      imageUrl: userProfile.imageUrl ?? '',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: AppColors.lightGrey,
                        child: Icon(
                          Icons.person,
                          size: 40.sp,
                          color: AppColors.grey,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: AppColors.lightGrey,
                        child: Icon(
                          Icons.person,
                          size: 40.sp,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 10.h),
                
                // Name and verification badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userProfile.name ?? 'profile_tab.user'.tr(),
                      style: AppStyles.header3.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (userProfile.isVerified == true)
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Icon(
                          Icons.verified,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      ),
                  ],
                ),
                
                SizedBox(height: 5.h),
                
                // Email
                Text(
                  userProfile.email ?? '',
                  style: AppStyles.bodyText2.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                
                SizedBox(height: 5.h),
                
                // Phone
                Text(
                  userProfile.phone ?? '',
                  style: AppStyles.bodyText2.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context, Data userProfile) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
            "${userProfile.totalOrders ?? 0}",
            Icons.shopping_bag_outlined,
          ),
          _buildVerticalDivider(),
          _buildStatItem(
            context,
            "profile_tab.reviews".tr(),
            "${userProfile.totalReviews ?? 0}",
            Icons.star_border,
          ),
          _buildVerticalDivider(),
          _buildStatItem(
            context,
            "profile_tab.earnings".tr(),
            "${userProfile.totalEarnings ?? 0}",
            Icons.account_balance_wallet_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
      BuildContext context, String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.primary,
          size: 24.sp,
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: AppStyles.header3.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          title,
          style: AppStyles.bodyText2.copyWith(
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 40.h,
      width: 1.w,
      color: AppColors.divider,
    );
  }

  Widget _buildWalletCard(BuildContext context, Data userProfile) {
    final wallet = userProfile.wallet?.isNotEmpty == true ? userProfile.wallet!.first : null;
    final balance = wallet?.balance ?? 0.0;
    final transactions = wallet?.transactions ?? [];

    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2C3E50),
            Color(0xFF4CA1AF),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Wallet Header
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                  size: 24.sp,
                ),
                SizedBox(width: 10.w),
                Text(
                  "profile_tab.wallet".tr(),
                  style: AppStyles.header3.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "profile_tab.add_funds".tr(),
                        style: AppStyles.bodyText2.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Balance
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "profile_tab.current_balance".tr(),
                      style: AppStyles.bodyText2.copyWith(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "${balance.toStringAsFixed(2)} SAR",
                      style: AppStyles.header3.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Recent Transactions
          if (transactions.isNotEmpty)
            Container(
              margin: EdgeInsets.all(20.w),
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "profile_tab.recent_transactions".tr(),
                    style: AppStyles.bodyText1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  ...transactions.take(2).map((transaction) {
                    final isDeposit = transaction.type == "deposit";
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: isDeposit
                                  ? Colors.green.withOpacity(0.2)
                                  : Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              isDeposit
                                  ? Icons.arrow_downward
                                  : Icons.arrow_upward,
                              color: isDeposit ? Colors.green : Colors.red,
                              size: 16.sp,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isDeposit
                                      ? "profile_tab.deposit".tr()
                                      : "profile_tab.withdrawal".tr(),
                                  style: AppStyles.bodyText2.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                if (transaction.createdAt != null)
                                  Text(
                                    _formatDate(transaction.createdAt!),
                                    style: AppStyles.caption.copyWith(
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Text(
                            "${isDeposit ? '+' : '-'} ${transaction.amount?.toStringAsFixed(2) ?? '0.00'} SAR",
                            style: AppStyles.bodyText2.copyWith(
                              color: isDeposit ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context, Data userProfile) {
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
              "${userProfile.totalOrders ?? 0}",
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
                  locations: userProfile.locations,
                ),
              );
            },
            child: MenuItem(
              icon: Icons.location_on,
              title: "profile_tab.saved_addresses".tr(),
              trailing: Text(
                "${userProfile.locations?.length ?? 0}",
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
              "${userProfile.totalReviews ?? 0}",
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
  
  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      return dateString;
    }
  }
}
