import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';
import '../../../../../core/routes/routes.dart';
import '../controller/get_user_location_cubit/get_user_location_cubit.dart';

class GetUserLocationView extends StatelessWidget {
  const GetUserLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<GetUserLocationCubit>(context);

    return BlocBuilder<GetUserLocationCubit, GetUserLocationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Pick Location',
              style: AppStyles.header1.copyWith(
                fontSize: 18.sp,
                color: AppColors.textPrimary,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.close,
                color: AppColors.icon,
              ),
              onPressed: () => Navigator.pushReplacementNamed(
                context,
                Routes.cusBottomNavigationBar,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.my_location,
                  color: AppColors.icon,
                  size: 24.sp,
                ),
                onPressed: () => viewModel.getUserLocation(),
              ),
            ],
          ),
          body: Stack(
            children: [
              // Google Map
              Positioned.fill(
                top: 0.h,
                child: GoogleMap(
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  markers: viewModel.markers,
                  onMapCreated: (controller) {
                    viewModel.cubitController = controller;
                    viewModel.initMapStyle(context);
                    // Get user location when map is created
                    viewModel.getUserLocation();
                  },
                  initialCameraPosition: viewModel.initialCameraPosition,
                  onTap: viewModel.onMapTapped,
                ),
              ),

              // Search Bar
              Positioned(
                top: 8.h,
                left: 16.w,
                right: 16.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      inputDecorationTheme: InputDecorationTheme(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: AppStyles.bodyText2.copyWith(
                          color: Colors.grey[600],
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    child: GooglePlaceAutoCompleteTextField(
                      textEditingController: TextEditingController(),
                      googleAPIKey: GetUserLocationCubit.apiKey,
                      inputDecoration: InputDecoration(
                        hintText: 'Search the map',
                        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                      ),
                      debounceTime: 800,
                      countries: const ['sa'],
                      isLatLngRequired: true,
                      getPlaceDetailWithLatLng: (Prediction prediction) {
                        viewModel.onPlaceSelected(prediction);
                      },
                      itemClick: (Prediction prediction) {
                        viewModel.onPlaceSelected(prediction);
                      },
                    ),
                  ),
                ),
              ),

              if (state is GetUserLocationLoadingState)
                Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),

              // Location Details Card
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Location Name
                      Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: AppColors.primary),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                viewModel.currentAddress.isEmpty
                                    ? 'Getting location...'
                                    : viewModel.currentAddress,
                                style: AppStyles.bodyText1.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Extra Details Section
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Extra details',
                              style: AppStyles.bodyText2.copyWith(
                                color: AppColors.textPrimary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextField(
                              decoration: InputDecoration(
                                hintText:
                                    'Building / Apartment Number (Optional)',
                                hintStyle: TextStyle(fontSize: 14.sp),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]!),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.3,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]!),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 12.h),
                              ),
                            ),
                            SizedBox(height: 16.h),

                            // Save Location Checkbox
                            Padding(
                              padding: EdgeInsets.all(16.w),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 24.w,
                                    height: 24.h,
                                    child: Checkbox(
                                      activeColor: AppColors.primary,
                                      value: true,
                                      onChanged: (value) {},
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Text(
                                    'Save location to use later',
                                    style: AppStyles.bodyText2,
                                  ),
                                ],
                              ),
                            ),

                            // Confirm Button
                            Padding(
                              padding: EdgeInsets.all(16.w),
                              child: CustomButton(
                                onPressed: () async {},
                                backgroundColor: AppColors.primary,
                                borderSideColor: AppColors.primary,
                                borderRadius: 8.r,
                                child: Text(
                                  'Confirm Location',
                                  style: AppStyles.buttonText.copyWith(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Current Location Button
              Positioned(
                right: 16.w,
                bottom: 340.h,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.layers),
                    onPressed: () {},
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
