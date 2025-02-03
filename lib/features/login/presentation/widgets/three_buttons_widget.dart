import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/cus_text_button.dart';

class ThreeButtonsWidget extends StatelessWidget {
  const ThreeButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'select_language'.tr(),
            // اختر اللغة
            style: AppStyles.header1.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          CusTextButton(
              buttonText: 'English',
              textStyle: AppStyles.buttonText,
              backgroundColor: AppColors.primaryLight,
              borderSideColor: Colors.transparent,
              onPressed: () {
                context.setLocale(const Locale('en'));
              }),
          SizedBox(height: 12.h),
          CusTextButton(
              buttonText: 'العربية',
              textStyle: AppStyles.buttonText,
              backgroundColor: AppColors.primaryLight,
              borderSideColor: Colors.transparent,
              onPressed: () {
                context.setLocale(const Locale('ar'));
              }),
          SizedBox(height: 20.h),
          // Get Started Button
          CusTextButton(
            buttonText: 'start_now'.tr(),
            // ابدأ الآن
            textStyle: AppStyles.buttonText.copyWith(
              color: AppColors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.loginView);
            },
            backgroundColor: AppColors.buttonPrimary,
            borderSideColor: AppColors.buttonPrimary,
            borderRadius: 20.r,
          ),
        ],
      ),
    );
  }
}
