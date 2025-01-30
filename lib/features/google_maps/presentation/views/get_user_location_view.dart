import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';

class GetUserLocationView extends StatelessWidget {
  const GetUserLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('get_user_location_view.confirm_location'.tr()),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.cusBottomNavigationBar);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.r),
          ),
          // height: 600.h,
          child: Column(
            children: [
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(0, 0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CusTextButton(
                  buttonText: 'get_user_location_view.choose'.tr(),
                  textStyle: AppStyles.buttonText,
                  onPressed: () {},
                  backgroundColor: AppColors.buttonPrimary,
                  borderSideColor: AppColors.primary,
                  // buttonWidth: 20.w,
                  // buttonHeight: 10.h,
                ),
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
