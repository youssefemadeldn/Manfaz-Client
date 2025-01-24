// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:manfaz/core/theme/app_colors.dart';
// import 'package:manfaz/core/theme/app_styles.dart';
// import 'package:manfaz/core/widgets/cus_text_button.dart';
// import 'package:manfaz/core/widgets/cus_text_form_field.dart';

// import '../../../../core/routes/routes.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/background.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 30.h),
//                   // App Logo
//                   Image.asset(
//                     'assets/images/manfaz_logo.png',
//                     height: 150.h,
//                   ),
//                   SizedBox(height: 30.h),
//                   // Welcome Text
//                   Text(
//                     'مرحبًا بك في منفذ',
//                     style: AppStyles.header1.copyWith(
//                       fontSize: 26.sp,
//                       color: AppColors.primary,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 10.h),
//                   // Caption Text
//                   Text(
//                     'قم بتسجيل الدخول إلى حسابك لمتابعة البحث عن الخدمات وإدارة طلباتك بكل سهولة.',
//                     style: AppStyles.caption.copyWith(
//                       fontSize: 14.sp,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 30.h),
//                   // Email Input
//                   CusTextFormField(
//                     hintText: 'البريد الإلكتروني',
//                     validator: (value) {},
//                   ),
//                   SizedBox(height: 15.h),
//                   // Password Input
//                   CusTextFormField(
//                     hintText: 'كلمة المرور',
//                     validator: (value) {},
//                     suffixIcon: Icon(Icons.visibility),
//                   ),
//                   SizedBox(height: 10.h),
//                   // Forgot Password Button
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           'نسيت كلمة المرور؟',
//                           style: AppStyles.buttonText.copyWith(
//                             color: AppColors.primary,
//                             fontSize: 13.sp,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20.h),
//                   // Login Button
//                   CusTextButton(
//                     buttonText: 'تسجيل الدخول',
//                     textStyle: AppStyles.buttonText,
//                     onPressed: () {
//                       Navigator.pushNamed(
//                           context, Routes.cusBottomNavigationBar);
//                     },
//                     backgroundColor: AppColors.primary,
//                     borderSideColor: AppColors.primary,
//                   ),
//                   SizedBox(height: 20.h),
//                   // Divider with Text
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Divider(color: AppColors.grey),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10.w),
//                         child: Text(
//                           'أو سجل باستخدام',
//                           style: AppStyles.bodyText3,
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(color: AppColors.grey),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 15.h),
//                   // Google Login Button
//                   CircleAvatar(
//                     radius: 30.r,
//                     backgroundColor: AppColors.lightGrey,
//                     child: IconButton(
//                         onPressed: () {},
//                         icon: SvgPicture.asset('assets/svg/google.svg')),
//                   ),
//                   SizedBox(height: 20.h),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         alignment: Alignment.center,
//         height: 50.h,
//         child: GestureDetector(
//           onTap: () => Navigator.pushNamed(context, Routes.registerView),
//           child: Text.rich(
//             TextSpan(
//               text: "ليس لديك حساب؟ ",
//               style: AppStyles.bodyText2.copyWith(
//                 color: AppColors.darkGrey,
//                 fontWeight: FontWeight.w600,
//               ),
//               children: [
//                 TextSpan(
//                   text: 'سجل الآن',
//                   style: AppStyles.smallText.copyWith(
//                     color: AppColors.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';
import 'package:manfaz/core/widgets/cus_text_form_field.dart';

import '../../../../core/routes/routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     'assets/images/background.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
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
                    fillColor: AppColors.background,
                    hintText: 'Email',
                    validator: (value) {},
                  ),
                  SizedBox(height: 15.h),
                  CusTextFormField(
                    fillColor: AppColors.background,
                    hintText: 'Password',
                    validator: (value) {},
                    suffixIcon: Icon(
                      Icons.visibility,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: AppStyles.buttonText.copyWith(
                            color: AppColors.primary,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CusTextButton(
                    buttonText: 'Login',
                    textStyle: AppStyles.buttonText,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.cusBottomNavigationBar);
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
          onTap: () => Navigator.pushNamed(context, Routes.registerView),
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
