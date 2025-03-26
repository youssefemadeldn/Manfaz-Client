import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class DeliveryLocationSelector extends StatelessWidget {
  final Map<String, dynamic>? selectedLocation;
  final Function(BuildContext) onLocationSelect;

  const DeliveryLocationSelector({
    super.key,
    this.selectedLocation,
    required this.onLocationSelect,
  });

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        title,
        style: AppStyles.header3.copyWith(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildLocationTile(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () => onLocationSelect(context),
      child: Container(
        margin: EdgeInsets.only(top: 8.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.bodyText1.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: AppStyles.bodyText2.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(tr('store_details.delivery.location.title')),
          _buildLocationTile(
            tr('store_details.delivery.location.service_location'),
            selectedLocation != null ? selectedLocation!['address'] : tr('store_details.delivery.location.select_service_location'),
            Icons.location_on_rounded,
            AppColors.primary,
            context,
          ),
        ],
      ),
    );
  }
}
