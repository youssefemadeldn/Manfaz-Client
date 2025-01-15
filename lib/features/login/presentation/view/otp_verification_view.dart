import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

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
                "Verify phone number",
                style: AppStyles.font32Black700,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "We have sent a verification code to your phone number. Please enter the code below to verify your account.",
                style: AppStyles.font20BlackRegular,
              ),
              SizedBox(
                height: 50.h,
              ),
              OtpTextField(
                focusedBorderColor: AppColors.mainBlue.withBlue(200),
                numberOfFields: 4,
                borderColor: Colors.pink,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              SizedBox(
                height: 50.h,
              ),
              // Didn't receive the code?, Resend
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: AppStyles.font18BlackRegular,
                  ),
                  Text(
                    "Resend",
                    style: AppStyles.font16BlackBold,
                  ),
                ],
              ),
              Spacer(),
              CusTextButton(
                buttonText: 'Continue',
                textStyle: AppStyles.font24WithRegular,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.successVerificationView);
                },
                backgroundColor: AppColors.black,
                verticalPadding: 10.h,
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
