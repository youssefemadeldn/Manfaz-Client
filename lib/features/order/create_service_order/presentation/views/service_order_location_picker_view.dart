import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import '../controller/service_order_location_picker_cubit/service_order_location_picker_cubit.dart';

class ServiceOrderLocationPickerView extends StatelessWidget {
  const ServiceOrderLocationPickerView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<ServiceOrderLocationPickerCubit>(context);

    return BlocBuilder<ServiceOrderLocationPickerCubit,
        ServiceOrderLocationPickerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              tr('create_service_order.location.select_on_map'),
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
              onPressed: () => Navigator.pop(context),
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
                      googleAPIKey: ServiceOrderLocationPickerCubit.apiKey,
                      inputDecoration: InputDecoration(
                        hintText: tr('create_service_order.location.search_map'),
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

              if (state is ServiceOrderLocationPickerLoadingState)
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
                                    ? tr('create_service_order.location.getting_location')
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
                              tr('create_service_order.location.extra_details'),
                              style: AppStyles.bodyText2.copyWith(
                                color: AppColors.textPrimary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextField(
                              decoration: InputDecoration(
                                hintText: tr('create_service_order.location.building_hint'),
                                hintStyle: TextStyle(fontSize: 14.sp),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]!),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]!),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      BorderSide(color: AppColors.primary),
                                ),
                              ),
                              onChanged: viewModel.onExtraDetailsChanged,
                            ),
                          ],
                        ),
                      ),

                      // Confirm Button
                      Padding(
                        padding: EdgeInsets.all(16.w),
                        child: ElevatedButton(
                          onPressed: () {
                            if (viewModel.currentAddress.isNotEmpty) {
                              Navigator.pop(context, {
                                'address': viewModel.currentAddress,
                                'extraDetails': viewModel.extraDetails,
                                'latitude': viewModel.selectedLocation?.latitude,
                                'longitude': viewModel.selectedLocation?.longitude,
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            minimumSize: Size(double.infinity, 48.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            tr('create_service_order.location.confirm_location'),
                            style: AppStyles.bodyText1.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
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
