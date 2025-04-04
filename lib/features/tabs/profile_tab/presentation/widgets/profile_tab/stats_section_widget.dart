import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../../../profile_tab/data/models/get_user_profile_model.dart';

class StatsSectionWidget extends StatelessWidget {
  final Data userProfile;

  const StatsSectionWidget({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
