import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';

class YourTurnView extends StatelessWidget {
  const YourTurnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How would you like to use the app?",
                style: AppStyles.header1,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Please choose what suits you for the best experience.",
                style: AppStyles.caption,
              ),
              SizedBox(
                height: 160.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Choose your role',
                  style: AppStyles.header2,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CusTextButton(
                verticalPadding: 10.h,
                buttonText: 'Service Provider',
                onPressed: () {},
                textStyle: AppStyles.buttonText,
                backgroundColor: AppColors.secondary,
              ),
              SizedBox(
                height: 20.h,
              ),
              CusTextButton(
                verticalPadding: 10.h,
                buttonText: 'Service Requester',
                onPressed: () {},
                textStyle: AppStyles.buttonText,
                backgroundColor: AppColors.secondary,
              ),
              Spacer(),
              CusTextButton(
                verticalPadding: 10.h,
                buttonText: 'Next',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.loginView);
                },
                textStyle: AppStyles.buttonText,
                backgroundColor: AppColors.primary,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
