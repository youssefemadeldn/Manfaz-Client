import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
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
                    'Welcome Back to Manfaz',
                    style: AppStyles.header1.copyWith(
                      fontSize: 26.sp,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Log in to your Manfaz account to continue your job search, manage applications, and stay updated with the latest job opportunities.',
                    style: AppStyles.caption.copyWith(
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),
                  CusTextFormField(
                    hintText: 'Email',
                    validator: (value) {},
                  ),
                  SizedBox(height: 15.h),
                  CusTextFormField(
                    hintText: 'Password',
                    validator: (value) {},
                    suffixIcon: Icon(Icons.visibility),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password',
                          style: AppStyles.buttonText.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: AppStyles.buttonText,
                    ),
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
                  SizedBox(height: 20.h),
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
          onTap: () => Navigator.pushNamed(context, '/register'),
          child: Text.rich(
            TextSpan(
              text: "Don't have an account? ",
              style: AppStyles.bodyText2.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: 'Sign Up now',
                  style: AppStyles.smallText.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
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
