import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/login/presentation/controller/otp_verification/otp_verification_cubit.dart';
import 'package:pinput/pinput.dart';
import 'package:easy_localization/easy_localization.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  Future<void> _showSuccessDialog(BuildContext context) async {
    // Show the success dialog with animation
    await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container(); // Placeholder, actual content is in transitionBuilder
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(curvedAnimation),
          child: FadeTransition(
            opacity: curvedAnimation,
            child: Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 400),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Background success circle
                          Container(
                            width: 120.w,
                            height: 120.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary.withOpacity(0.1),
                            ),
                          ),
                          // Lottie animation
                          Lottie.asset(
                            'assets/animations/success.json',
                            width: 150.w,
                            height: 150.w,
                            repeat: false,
                            delegates: LottieDelegates(
                              values: [
                                ValueDelegate.color(
                                  const ['**'],
                                  value: AppColors.primary,
                                ),
                              ],
                            ),
                            onLoaded: (composition) {
                              // Wait for animation to complete
                              Future.delayed(composition.duration, () {
                                // Add a small delay after animation completes
                                Future.delayed(
                                  const Duration(milliseconds: 500),
                                  () {
                                    // Fade out dialog and navigate
                                    Navigator.of(context).pushReplacementNamed(
                                      Routes.loginView,
                                      arguments: const RouteSettings(
                                        arguments: {'showWelcome': true},
                                      ),
                                    );
                                  },
                                );
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 600),
                        tween: Tween(begin: 0.0, end: 1.0),
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(0, 20 * (1 - value)),
                              child: child,
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Text(
                              'Verification Successful!',
                              style: AppStyles.header2.copyWith(
                                color: AppColors.primary,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'Your account has been verified successfully.',
                              style: AppStyles.bodyText2.copyWith(
                                color: AppColors.textSecondary,
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.h,
      textStyle: AppStyles.header2.copyWith(
        color: AppColors.primary,
        fontSize: 24.sp,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15.r),
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
    );

    return BlocProvider(
      create: (context) => OtpVerificationCubit(),
      child: BlocConsumer<OtpVerificationCubit, OtpVerificationState>(
        listener: (context, state) {
          if (state is OtpVerificationSuccess) {
            _showSuccessDialog(context);
          } else if (state is OtpVerificationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.failure.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<OtpVerificationCubit>();

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: AppColors.primary),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      // Verification Icon
                      Icon(
                        Icons.verified_user_rounded,
                        size: 100.sp,
                        color: AppColors.primary,
                      ),
                      SizedBox(height: 30.h),

                      // Header Section
                      Text(
                        'verification.title'.tr(),
                        style: AppStyles.header1.copyWith(
                          color: AppColors.primary,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'verification.description'.tr(),
                        style: AppStyles.bodyText2.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      // OTP Input Section
                      SizedBox(height: 50.h),
                      Pinput(
                        length: 4,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            border:
                                Border.all(color: AppColors.primary, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: AppColors.primaryLight.withOpacity(0.1),
                            border: Border.all(color: AppColors.primary),
                          ),
                        ),
                        separatorBuilder: (index) => SizedBox(width: 15.w),
                        onCompleted: (pin) => cubit.verifyOtp(pin),
                        onChanged: (pin) => cubit.updatePin(pin),
                      ),

                      // Timer Section
                      SizedBox(height: 30.h),
                      if (state is OtpTimerTick) ...[
                        AnimatedOpacity(
                          opacity: !state.canResend ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            cubit.formatTime(state.remainingTime),
                            style: AppStyles.bodyText1.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),

                        // Resend Code Section
                        SizedBox(height: 16.h),
                        TextButton(
                          onPressed: state.canResend ? cubit.resendOtp : null,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                          ),
                          child: Text(
                            'verification.resend_code'.tr(),
                            style: AppStyles.bodyText2.copyWith(
                              color: state.canResend
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                              decoration: state.canResend
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],

                      // Verify Button
                      SizedBox(height: 40.h),
                      Container(
                        width: double.infinity,
                        height: 55.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: state is OtpVerificationLoading
                              ? null
                              : () => cubit.verifyOtp(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            elevation: 0,
                          ),
                          child: state is OtpVerificationLoading
                              ? CircularProgressIndicator(
                                  color: AppColors.white,
                                  strokeWidth: 3,
                                )
                              : Text(
                                  'verification.verify'.tr(),
                                  style: AppStyles.bodyTextBold.copyWith(
                                    color: AppColors.white,
                                    fontSize: 18.sp,
                                  ),
                                ),
                        ),
                      ),

                      // Change Number Section
                      SizedBox(height: 20.h),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'verification.change_account'.tr(),
                          style: AppStyles.bodyText2.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
