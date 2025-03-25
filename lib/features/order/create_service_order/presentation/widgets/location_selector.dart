import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/routes/routes.dart';

class LocationSelector extends StatelessWidget {
  final void Function(Map<String, dynamic>) onLocationSelected;
  final Map<String, dynamic>? selectedLocation;

  const LocationSelector({
    super.key,
    required this.onLocationSelected,
    this.selectedLocation,
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
      onTap: () async {
        final result = await Navigator.pushNamed(
          context,
          Routes.serviceOrderLocationPickerView,
        ) as Map<String, dynamic>?;
        
        if (result != null) {
          onLocationSelected(result);
        }
      },
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(tr('create_service_order.location.title')),
        _buildLocationTile(
          tr('create_service_order.location.service_location_title'),
          selectedLocation != null 
              ? selectedLocation!['address'] 
              : tr('create_service_order.location.select_location_hint'),
          Icons.location_on_rounded,
          AppColors.primary,
          context,
        ),
      ],
    );
  }
}
