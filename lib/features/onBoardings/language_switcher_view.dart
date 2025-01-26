import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';

class LanguageSwitcherView extends StatelessWidget {
  const LanguageSwitcherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryLight, AppColors.primaryDark],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60.h),
                  // Main Image with Shadow
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10.r,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/delivery-man.png',
                      // width: 300.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  // Header Text
                  Text(
                    'select_language'.tr(),
                    // اختر اللغة
                    style: AppStyles.header1.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  // Language Selection Buttons
                  Column(
                    children: [
                      CusTextButton(
                          buttonText: 'English',
                          textStyle: AppStyles.buttonText,
                          onPressed: () {
                            context.setLocale(const Locale('en'));
                          }),
                      SizedBox(height: 12.h),
                      CusTextButton(
                          buttonText: 'العربية',
                          textStyle: AppStyles.buttonText,
                          // backgroundColor: AppColors.background,
                          onPressed: () {
                            context.setLocale(const Locale('ar'));
                          }),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  // Start Button
                  CusTextButton(
                    buttonText: 'start_now'.tr(),
                    // ابدأ الآن
                    textStyle: AppStyles.buttonText.copyWith(
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.onBoarding);
                    },
                    backgroundColor: AppColors.buttonPrimary,
                    borderSideColor: AppColors.buttonPrimary,
                    borderRadius: 20.r,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
