import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';

class WelcomeToOurAppView extends StatelessWidget {
  const WelcomeToOurAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Image.asset(
                  'assets/images/get_started_person.png',
                  width: double.infinity,
                  // height: 400,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Find Interested Services',
                  // textScaleFactor: 1,
                  style: AppStyles.header1.copyWith(
                    color: AppColors.black,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  textScaleFactor: 2,
                  'Discover top talent for every need, and bring your ideas to life!',
                  style: AppStyles.header3.copyWith(
                    color: AppColors.grey,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(
                  height: 170.h,
                ),
                CusTextButton(
                  buttonText: 'Get Started',
                  textStyle: AppStyles.buttonText,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.loginView);
                  },
                  backgroundColor: AppColors.buttonPrimary,
                  borderSideColor: AppColors.buttonPrimary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
