import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';

import '../controller/google_maps_cubit/google_maps_cubit.dart';

class GetUserLocationView extends StatelessWidget {
  const GetUserLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<GoogleMapsCubit>(context);
    return Scaffold(
      body: Center(
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.r),
          ),
          // height: 600.h,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: MediaQuery.of(context)
                    .size
                    .height, // Adjust height as needed
                width: double.infinity,
                child: GoogleMap(
                  // polylines: viewModel.polylines,
                  // polygons: viewModel.polygons,
                  // zoomControlsEnabled: false,
                  markers: viewModel.markers,
                  onMapCreated: (controller) {
                    viewModel.cubitController = controller;
                    viewModel.initMapStyle(context);
                    viewModel.updateLocation();
                  },

                  initialCameraPosition: CameraPosition(
                    target: LatLng(24.72087070791564, 46.67037450156113),
                    zoom: 13,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Positioned(
                bottom: 30.h,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomButton(
                    onPressed: () async {
                      await viewModel.updateLocation();
                    },
                    backgroundColor: AppColors.buttonPrimary,
                    borderSideColor: AppColors.primary,
                    borderRadius: 30.r,
                    child: Text(
                      'get_user_location_view.choose'.tr(),
                      style: AppStyles.buttonText,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 100.h,
                left: 10.w,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    iconSize: 30.sp,
                    color: AppColors.primarySwatch,
                    onPressed: () {},
                    icon: Icon(Icons.gps_fixed_rounded),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
