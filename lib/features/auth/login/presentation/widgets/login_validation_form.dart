import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';

import '../../../../../core/helper/regex_helper.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/cus_text_button.dart';
import '../../../../../core/widgets/cus_text_form_field.dart';
import '../controller/login_cubit/login_cubit.dart';
import '../controller/login_cubit/login_state.dart';

class LoginValidationForm extends StatefulWidget {
  const LoginValidationForm({super.key});

  @override
  State<LoginValidationForm> createState() => _LoginValidationFormState();
}

class _LoginValidationFormState extends State<LoginValidationForm> {
  final formKey = GlobalKey<FormState>();
  String? userType;

  // final List<Map<String, String>> userTypes = [
  //   {'value': 'worker', 'label': 'Worker'},
  //   {'value': 'user', 'label': 'User'},
  // ];

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
          // DropdownButtonFormField<String>(
          //   borderRadius: BorderRadius.circular(23.r),
          //   value: userType,
          //   isExpanded: true,
          //   dropdownColor: AppColors.background,
          //   icon: Icon(Icons.arrow_drop_down, color: AppColors.grey),
          //   decoration: InputDecoration(
          //     fillColor: AppColors.background,
          //     filled: true,
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //       borderSide: BorderSide(color: AppColors.grey),
          //       gapPadding: 10,
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //       borderSide: BorderSide(color: AppColors.grey),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //       borderSide: BorderSide(color: AppColors.primary),
          //     ),
          //     contentPadding:
          //         EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          //   ),
          //   hint: Text('Select Type', style: AppStyles.caption),
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'login.user_type_required'.tr();
          //     }
          //     return null;
          //   },
          //   items: userTypes.map((type) {
          //     return DropdownMenuItem(
          //       value: type['value'],
          //       child: Text(
          //         type['label']!,
          //         style: AppStyles.bodyText3.copyWith(
          //           color: AppColors.black,
          //           fontSize: 16.sp,
          //         ),
          //       ),
          //     );
          //   }).toList(),
          //   onChanged: (String? newValue) {
          //     setState(() {
          //       userType = newValue;
          //       context.read<LoginCubit>().userType = newValue!;
          //     });
          //   },
          // ),

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
              color: AppColors.grey,
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
                return CustomButton(
                  buttonHeight: 70.h,
                  onPressed: () {},
                  backgroundColor: AppColors.primary,
                  borderSideColor: AppColors.primary,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                    ),
                  ),
                );
              }
              return CustomButton(
                buttonHeight: 70.h,
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
