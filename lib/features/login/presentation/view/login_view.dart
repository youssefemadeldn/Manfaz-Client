import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';
import 'package:manfaz/features/login/presentation/widgets/cus_google_button.dart';
import 'package:phone_form_field/phone_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                'Login',
                style: AppStyles.buttonText,
              ),
              SizedBox(
                height: 80.h,
              ),
              Text(
                'phone number',
                style: AppStyles.bodyText1,
              ),
              SizedBox(
                height: 10.h,
              ),
              PhoneFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                initialValue: PhoneNumber.parse('+33'), // or use the controller
                validator: PhoneValidator.compose([
                  PhoneValidator.required(context),
                  PhoneValidator.validMobile(context)
                ]),
                countrySelectorNavigator: const CountrySelectorNavigator.page(),
                onChanged: (phoneNumber) => print('changed into $phoneNumber'),
                enabled: true,
                isCountrySelectionEnabled: true,
                isCountryButtonPersistent: true,
                countryButtonStyle: const CountryButtonStyle(
                  showDialCode: true,
                  showIsoCode: true,
                  showFlag: true,
                  flagSize: 16,
                ),
              ),
              Spacer(),
              CusTextButton(
                buttonText: 'login',
                textStyle: AppStyles.buttonText,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.otpVerificationView);
                },
                verticalPadding: 10.h,
                backgroundColor: AppColors.primary,
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  'or',
                  style: AppStyles.smallText,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  'login with',
                  style: AppStyles.smallText,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              CusGoogleButton(
                buttonText: 'Google',
                textStyle: AppStyles.bodyText1,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.otpVerificationView);
                },
                verticalPadding: 10.h,
                backgroundColor: AppColors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
