import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:pinput/pinput.dart';
import 'package:easy_localization/easy_localization.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                 
                crossAxisAlignment: CrossAxisAlignment.start,
              
                children: [
                  
                  // Header Section
                  Text(
                    'verification.title'.tr(),
                    style: AppStyles.header1.copyWith(
                      color: AppColors.primary,
                      fontSize: 28.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'verification.description'.tr(),
                    style: AppStyles.bodyText2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  
                  // OTP Input Section
                  SizedBox(height: 40.h),
                  Center(
                    child: Pinput(
                      length: 4,
                      defaultPinTheme: PinTheme(
                        width: 45.w,
                        height: 45.h,
                        textStyle: AppStyles.header2.copyWith(
                          color: AppColors.primary,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.primaryLight.withOpacity(0.3)),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.05),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 45.w,
                        height: 45.h,
                        textStyle: AppStyles.header2.copyWith(
                          color: AppColors.primary,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.primary),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      onCompleted: (pin) {
                        // Handle OTP verification here
                      },
                    ),
                  ),
              
                  // Timer Section
                  // SizedBox(height: 24.h),
                  // Center(
                  //   child: Text(
                  //     '03:00',
                  //     style: AppStyles.bodyText1.copyWith(
                  //       color: AppColors.primary,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
              
                  // Resend Code Section
                  SizedBox(height: 16.h),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Handle resend code
                      },
                      child: Text(
                        'verification.resend_code'.tr(),
                        style: AppStyles.bodyText2.copyWith(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
              
                  // Verify Button
                  SizedBox(height: 40.h),
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle verification
                        Navigator.pushReplacementNamed(context, Routes.loginView);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        'verification.verify'.tr(),
                        style: AppStyles.bodyTextBold.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
              
                  // Change Number Section
                  SizedBox(height: 16.h),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'verification.change_account'.tr(),
                        style: AppStyles.bodyText2.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}