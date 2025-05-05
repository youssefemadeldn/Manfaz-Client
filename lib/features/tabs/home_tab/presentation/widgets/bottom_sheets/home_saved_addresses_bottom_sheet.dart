import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import '../../../data/models/get_user_locations_response_model.dart';

class HomeSavedAddressesBottomSheet extends StatelessWidget {
  final List<Data> locations;
  final VoidCallback addNewAddress;
  final Function(Data) onLocationSelected;

  const HomeSavedAddressesBottomSheet({
    super.key,
    required this.locations,
    required this.addNewAddress,
    required this.onLocationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "profile_tab.saved_addresses".tr(),
                style: AppStyles.listTileTitle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: AppColors.grey),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          
          // List of addresses
          if (locations.isEmpty)
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Text(
                  "home.no_saved_addresses".tr(),
                  style: AppStyles.listTileSubtitle,
                ),
              ),
            )
          else
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: locations.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: AppColors.divider,
                ),
                itemBuilder: (context, index) {
                  final location = locations[index];
                  return _buildAddressItem(context, location);
                },
              ),
            ),
            
          // Add new address button
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: addNewAddress,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: Size(double.infinity, 48.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              "home.add_new_address".tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildAddressItem(BuildContext context, Data location) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.location_on,
              color: AppColors.primary,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      location.name ?? "",
                      style: AppStyles.listTileTitle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    if (location.isDefault == true)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          "home.default".tr(),
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  location.address ?? "",
                  style: AppStyles.listTileSubtitle,
                ),
                SizedBox(height: 2.h),
                Text(
                  "${location.area ?? ""}, ${location.city ?? ""}",
                  style: AppStyles.listTileSubtitle.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.location_on, color: AppColors.primary),
                onPressed: () {
                  onLocationSelected(location);
                },
                iconSize: 20.sp,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                tooltip: "home.select_location".tr(),
              ),
              SizedBox(height: 8.h),
              IconButton(
                icon: Icon(Icons.edit_outlined, color: AppColors.grey),
                onPressed: () {
                  // TODO: Navigate to edit address screen
                },
                iconSize: 20.sp,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                tooltip: "home.edit_location".tr(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
