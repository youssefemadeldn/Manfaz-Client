import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/helper/bottom_sheet_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../../../profile_tab/data/models/get_user_profile_model.dart';
import '../saved_addresses_bottom_sheet.dart';
import '../menu_item.dart';

class MenuItemsWidget extends StatelessWidget {
  final Data userProfile;
  final VoidCallback? onAddressesPressed;

  const MenuItemsWidget({
    Key? key,
    required this.userProfile,
    this.onAddressesPressed,
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
              if (onAddressesPressed != null) {
                onAddressesPressed!();
              } else {
                BottomSheetHelper.show(
                  context: context,
                  child: SavedAddressesBottomSheet(
                    locations: userProfile.locations,
                  ),
                );
              }
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
          // Commented out items from original code
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
}
