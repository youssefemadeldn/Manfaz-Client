import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class PriceInfoWidget extends StatelessWidget {
  final double price;
  final double totalAmount;
  final int duration;

  const PriceInfoWidget({
    super.key,
    required this.price,
    required this.totalAmount,
    required this.duration,
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

  Widget _buildPriceRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppStyles.bodyText2.copyWith(color: AppColors.grey),
          ),
          Text(
            value,
            style: AppStyles.bodyText1.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Price Details'),
          _buildPriceRow('Service Price', '\$${price.toStringAsFixed(2)}'),
          _buildPriceRow('Duration', '$duration hours'),
          Divider(height: 24.h, color: Colors.grey[300]),
          _buildPriceRow('Total Amount', '\$${totalAmount.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
