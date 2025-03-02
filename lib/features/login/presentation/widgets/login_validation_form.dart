import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/features/login/presentation/controller/login_cubit/login_cubit.dart';

import '../../../../core/helper/regex_helper.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/cus_text_button.dart';
import '../../../../core/widgets/cus_text_form_field.dart';
import '../controller/login_cubit/login_state.dart';

class LoginValidationForm extends StatefulWidget {
  const LoginValidationForm({super.key});

  @override
  State<LoginValidationForm> createState() => _LoginValidationFormState();
}

class _LoginValidationFormState extends State<LoginValidationForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CusTextFormField(
            fillColor: AppColors.background,
            hintText: 'email'.tr(),
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'login.email_required'.tr();
              }
              if (!RegexHelper.isValidEmail(value)) {
                return 'login.email_validation'.tr();
              }
              return null;
            },
          ),
          SizedBox(height: 15.h),
          CusTextFormField(
            fillColor: AppColors.background,
            hintText: 'password'.tr(),
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'login.password_required'.tr();
              }
              if (value.length < 8) {
                return 'login.password_validation'.tr();
              }
              return null;
            },
            isObscureText: context.read<LoginCubit>().isPasswordVisible,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  context.read<LoginCubit>().isPasswordVisible =
                      !context.read<LoginCubit>().isPasswordVisible;
                });
                // .togglePasswordVisibility();
              },
              icon: Icon(
                Icons.visibility,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'forgot_password'.tr(),
                  style: AppStyles.buttonText.copyWith(
                    color: AppColors.primary,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return CupertinoActivityIndicator(
                  animating: true,
                  radius: 15.r,
                );
              }
              return CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginCubit>().emitLoginState();
                  }
                },
                backgroundColor: AppColors.primary,
                borderSideColor: AppColors.primary,
                child: Text(
                  'login.login'.tr(),
                  style: AppStyles.buttonText,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
