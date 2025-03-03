import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/helper/dialog_helper.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/login/presentation/controller/login_cubit/login_cubit.dart';
import 'package:manfaz/features/login/presentation/controller/login_cubit/login_state.dart';
import 'package:manfaz/features/login/presentation/widgets/loading_overlay.dart';

import '../../../../core/routes/routes.dart';
import '../widgets/login_validation_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isLoading = false;
  bool _showSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LoadingOverlay(
        isLoading: _isLoading,
        showSuccess: _showSuccess,
        child: Stack(
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 50.h,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.registerView),
          child: Text.rich(
            TextSpan(
              text: 'no_account'.tr(),
              style: AppStyles.bodyText2.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: 'sign_up_now'.tr(),
                  style: AppStyles.smallText.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginListenerMethod(context, state) {
    switch (state) {
      // case LoginLoading():
      //   setState(() {
      //     _isLoading = true;
      //     _showSuccess = false;
      //   });
      case LoginSuccess():
        setState(() {
          _isLoading = false;
          _showSuccess = true;
        });
        Future.delayed(const Duration(milliseconds: 1500), () {
          Navigator.pushReplacementNamed(
            context,
            Routes.cusBottomNavigationBar,
          );
        });
      case LoginError():
        setState(() {
          _isLoading = false;
          _showSuccess = false;
        });
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
