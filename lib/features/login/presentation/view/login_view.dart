import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manfaz/core/helper/dialog_helper.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/login/presentation/controller/login_cubit/login_cubit.dart';
import 'package:manfaz/features/login/presentation/controller/login_cubit/login_state.dart';

import '../../../../core/routes/routes.dart';
import '../widgets/login_validation_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
              child: BlocListener<LoginCubit, LoginState>(
                listener: loginListenerMethod,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    Image.asset(
                      'assets/images/manfaz_logo.png',
                      height: 150.h,
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      'welcome'.tr(),
                      style: AppStyles.header1.copyWith(
                        fontSize: 26.sp,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'login_description'.tr(),
                      style: AppStyles.caption.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.darkGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.h),
                    // form
                    LoginValidationForm(),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'no_account'.tr(),
                          style: AppStyles.bodyText2,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.registerView);
                          },
                          child: Text(
                            'sign_up_now'.tr(),
                            style: AppStyles.buttonText.copyWith(
                              color: AppColors.primary,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'or_sign_in_with'.tr(),
                      style: AppStyles.bodyText2,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/svg/google.svg',
                            height: 24.h,
                          ),
                        ),
                        // SizedBox(width: 20.w),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: SvgPicture.asset(
                        //     'assets/icons/facebook.svg',
                        //     height: 24.h,
                        //   ),
                        // ),
                        // SizedBox(width: 20.w),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: SvgPicture.asset(
                        //     'assets/icons/apple.svg',
                        //     height: 24.h,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void loginListenerMethod(context, state) {
    switch (state) {
      case LoginLoading():
        DialogHelper.showLoadingDialog(
          context: context,
          indicatorColor: AppColors.primary,
        );
      case LoginSuccess():
        context.read<LoginCubit>().close();
        DialogHelper.hideLoadingDialog(context);
        Navigator.pushReplacementNamed(
          context,
          Routes.cusBottomNavigationBar,
        );
      case LoginError():
        DialogHelper.hideLoadingDialog(context);
        DialogHelper.showCustomDialog(
          context: context,
          title: Text(state.failure.failureTitle),
          content: Text(state.failure.errorMessage),
        );
      case LoginInitial():
        break;
    }
  }
}
