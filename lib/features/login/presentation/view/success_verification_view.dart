import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_styles.dart';

class SuccessVerificationView extends StatelessWidget {
  const SuccessVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.cusBottomNavigationBar);
                  },
                  child: SvgPicture.asset(
                    'assets/svg/doneVerification.svg',
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Verified successfully',
                  style: AppStyles.font20BlackBold,
                ),
                Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
