import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';
import 'package:manfaz/core/widgets/cus_text_form_field.dart';

import '../../../../core/helper/dialog_helper.dart';
import '../../../../core/helper/regex_helper.dart';
import '../../../../core/theme/app_styles.dart';
import '../controller/register_cubit/register_cubit.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 50.h),
              child: BlocListener<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  switch (state) {
                    case RegisterLoading():
                      DialogHelper.showLoadingDialog(
                          context: context, indicatorColor: AppColors.primary);

                    case RegisterSuccess():
                      DialogHelper.hideLoadingDialog(context);
                      DialogHelper.showCustomDialog(
                        context: context,
                        content: Text('register.register_success'.tr()),
                        contentStyle: AppStyles.dialogContentDark,
                        leftActionStyle: AppStyles.dialogActionBlue,
                        rightActionStyle: AppStyles.dialogActionBlue,
                        title: Icon(
                          Icons.check_circle,
                          color: AppColors.green,
                          size: 25.r,
                        ),
                        onConfirm: () {
                          // Navigator.pushNamed(context, Routes.otpVerificationView);
                        },
                      );
                    case RegisterError():
                      DialogHelper.hideLoadingDialog(context);
                      DialogHelper.showCustomDialog(
                        context: context,
                        title: Text(
                          state.failure.failureTitle,
                          style: AppStyles.dialogTitleDark,
                        ),
                        content: Text(state.failure.errorMessage),
                        contentStyle: AppStyles.dialogContentDark,
                        leftActionStyle: AppStyles.dialogActionBlue,
                        rightActionStyle: AppStyles.dialogActionBlue,
                      );
                      break;
                    default:
                  }
                },
                child: Form(
                  key: formKey,
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
                        'register.create_account'.tr(),
                        style: AppStyles.header1.copyWith(
                          fontSize: 26.sp,
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'register.description'.tr(),
                        style: AppStyles.caption.copyWith(
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30.h),
                      CusTextFormField(
                        fillColor: AppColors.background,
                        hintText: 'register.full_name'.tr(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'register.name_validation'.tr();
                          }
                        },
                        controller: BlocProvider.of<RegisterCubit>(context)
                            .nameController,
                      ),
                      SizedBox(height: 15.h),
                      CusTextFormField(
                        fillColor: AppColors.background,
                        hintText: 'register.email'.tr(),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegexHelper.isValidEmail(value)) {
                            return 'register.email_validation'.tr();
                          }
                        },
                        controller: BlocProvider.of<RegisterCubit>(context)
                            .emailController,
                      ),
                      SizedBox(height: 15.h),
                      CusTextFormField(
                        fillColor: AppColors.background,
                        hintText: 'register.phone'.tr(),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegexHelper.isValidPhoneNumber(value)) {
                            return 'register.phone_validation'.tr();
                          }
                        },
                        controller: BlocProvider.of<RegisterCubit>(context)
                            .phoneController,
                      ),
                      SizedBox(height: 15.h),
                      CusTextFormField(
                        isObscureText: isPasswordVisible,
                        fillColor: AppColors.background,
                        hintText: 'register.password'.tr(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'register.password_validation'.tr();
                          }
                        },
                        controller: BlocProvider.of<RegisterCubit>(context)
                            .passwordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                            // .togglePasswordVisibility();
                          },
                          icon: Icon(
                            Icons.visibility,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CusTextButton(
                        buttonText: 'register.sign_up'.tr(),
                        textStyle: AppStyles.buttonText,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await BlocProvider.of<RegisterCubit>(context)
                                .emitRegisterState();
                          }
                        },
                        backgroundColor: AppColors.primary,
                        borderSideColor: AppColors.primary,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1.h,
                            color: AppColors.grey,
                            width: 117.26.w,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'register.or_sign_in_with'.tr(),
                            style: AppStyles.bodyText3,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 5.w),
                          Container(
                            height: 1.h,
                            color: AppColors.grey,
                            width: 117.26.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: AppColors.lightGrey,
                        child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/svg/google.svg')),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 50.h,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text.rich(
            TextSpan(
              text: 'register.already_have_account'.tr(),
              style: AppStyles.bodyText2.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: 'register.login_here'.tr(),
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
}
