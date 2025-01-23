import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';
import 'package:manfaz/core/widgets/cus_text_form_field.dart';

import '../../../../core/theme/app_styles.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150.h,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Create Your Manfaz Account',
                    style: AppStyles.header1.copyWith(
                      fontSize: 26.sp,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Join Manfaz to find your perfect job. Create an account for personalized matches and career resources.',
                    style: AppStyles.caption.copyWith(
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),
                  CusTextFormField(
                      hintText: 'Full Name', validator: (value) {}),
                  SizedBox(height: 15.h),
                  CusTextFormField(
                    hintText: 'Email',
                    validator: (value) {},
                  ),
                  SizedBox(height: 15.h),
                  CusTextFormField(
                    hintText: 'Phone Number',
                    validator: (value) {},
                  ),
                  SizedBox(height: 15.h),
                  CusTextFormField(
                    hintText: 'Password',
                    validator: (value) {},
                  ),
                  SizedBox(height: 20.h),
                  CusTextButton(
                    buttonText: 'Sign Up',
                    textStyle: AppStyles.buttonText,
                    onPressed: () {},
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
                        'Or Sign In With',
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
        ],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 50.h,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text.rich(
            TextSpan(
              text: 'Already have an account? ',
              style: AppStyles.bodyText2.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: 'Login here',
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
