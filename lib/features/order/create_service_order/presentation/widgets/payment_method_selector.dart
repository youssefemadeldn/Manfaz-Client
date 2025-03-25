import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class PaymentMethodSelector extends StatelessWidget {
  final String? selectedPaymentMethod;
  final List<String> paymentMethods;
  final void Function(String) onPaymentMethodSelected;

  const PaymentMethodSelector({
    super.key,
    required this.selectedPaymentMethod,
    required this.paymentMethods,
    required this.onPaymentMethodSelected,
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

  Widget _buildPaymentMethodTile(String method) {
    final bool isSelected = selectedPaymentMethod == method;
    return GestureDetector(
      onTap: () => onPaymentMethodSelected(method),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : AppColors.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey[300]!,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary.withOpacity(0.2) : AppColors.surface,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.grey[300]!,
                ),
              ),
              child: Icon(
                Icons.payment_rounded,
                color: isSelected ? AppColors.primary : AppColors.grey,
                size: 20.w,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                tr('create_service_order.payment.${method.toLowerCase()}'),
                style: AppStyles.bodyText1.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? AppColors.primary : Colors.black87,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle_rounded,
                color: AppColors.primary,
                size: 24.w,
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
        _buildSectionTitle(tr('create_service_order.payment.title')),
        ...paymentMethods.map((method) => _buildPaymentMethodTile(method)),
      ],
    );
  }
}
