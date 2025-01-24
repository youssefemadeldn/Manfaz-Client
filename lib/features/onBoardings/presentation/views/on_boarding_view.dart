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
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              child: SingleChildScrollView(
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
                        'assets/images/plumer_making_ok.png',
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    // Header Text
                    Text(
                      'Manfaz \n Your comprehensive services platform',
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
                      'Discover the best service providers in Saudi Arabia, and start realizing your ideas with ease and professionalism.',
                      // اكتشف أفضل مزودي الخدمات في المملكة العربية السعودية، وابدأ في تحقيق أفكارك بكل سهولة واحترافية.
                      textAlign: TextAlign.center,
                      style: AppStyles.bodyText1.copyWith(
                        color: AppColors.white.withOpacity(0.9),
                        fontSize: 14.sp,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 170.h),
                    // Get Started Button
                    CusTextButton(
                      buttonText: 'Start Now',
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
            ),
          ],
        ),
      ),
    );
  }
}
