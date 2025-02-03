import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
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
                        'assets/images/plumer_making_ok.png',
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    // Header Text
                    Text(
                      'on_boarding_title'.tr(),
                      // منفذ - منصة خدماتك الشاملة
                      style: AppStyles.header1.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.h),
                    // Caption Text
                    Text(
                      'on_boarding_description'.tr(),
                      // اكتشف أفضل مزودي الخدمات في المملكة العربية السعودية، وابدأ في تحقيق أفكارك بكل سهولة واحترافية.
                      textAlign: TextAlign.center,
                      style: AppStyles.bodyText1.copyWith(
                        color: AppColors.white.withOpacity(0.9),
                        fontSize: 14.sp,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    SizedBox(
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
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
