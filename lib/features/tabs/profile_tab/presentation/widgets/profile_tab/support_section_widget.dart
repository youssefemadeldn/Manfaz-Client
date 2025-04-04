import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../menu_item.dart';

class SupportSectionWidget extends StatelessWidget {
  final VoidCallback? onSettingsPressed;
  final VoidCallback? onLogoutPressed;

  const SupportSectionWidget({
    Key? key,
    this.onSettingsPressed,
    this.onLogoutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          // Commented out items from original code
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
            onTap: () {
              if (onSettingsPressed != null) {
                onSettingsPressed!();
              } else {
                Navigator.pushNamed(context, Routes.settingsView);
              }
            },
            child: MenuItem(
              icon: Icons.settings_outlined,
              title: "profile_tab.settings".tr(),
              showTrailingArrow: true,
            ),
          ),
          Divider(height: 1, color: AppColors.divider),
          MenuItem(
            onTap: () async {
              if (onLogoutPressed != null) {
                onLogoutPressed!();
              } else {
                await SharedPrefUtils.removeData('hasLoggedIn');
                Navigator.pushReplacementNamed(context, Routes.loginView);
              }
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
