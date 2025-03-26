import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/custom_button.dart';
import '../controller/delivery_order_location_picker_cubit/delivery_order_location_picker_cubit.dart';

class DeliveryOrderLocationPickerView extends StatelessWidget {
  const DeliveryOrderLocationPickerView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<DeliveryOrderLocationPickerCubit>(context);

    return BlocBuilder<DeliveryOrderLocationPickerCubit,
        DeliveryOrderLocationPickerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              tr('store_details.delivery.location.pick_location'),
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
              // Map
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: viewModel.initialPosition,
                  zoom: 15,
                ),
                onMapCreated: (controller) {
                  viewModel.onMapCreated(controller);
                  viewModel.initMapStyle(context);
                },
                markers: viewModel.markers,
                onTap: viewModel.onMapTapped,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
              ),

              // Search Bar
              Positioned(
                top: 16.h,
                left: 16.w,
                right: 16.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: GooglePlaceAutoCompleteTextField(
                    textEditingController: viewModel.searchController,
                    googleAPIKey: "YOUR_API_KEY",
                    inputDecoration: InputDecoration(
                      hintText: tr('store_details.delivery.location.search_map'),
                      hintStyle: AppStyles.bodyText2.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      prefixIcon: Icon(Icons.search, color: AppColors.icon),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                    ),
                    debounceTime: 800,
                    countries: const ["sa"],
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) {
                      viewModel.onPlaceSelected(prediction);
                    },
                    itemClick: (Prediction prediction) {
                      viewModel.searchController.text = prediction.description ?? "";
                      viewModel.searchController.selection =
                          TextSelection.fromPosition(TextPosition(
                              offset: prediction.description?.length ?? 0));
                    },
                    seperatedBuilder: Divider(),
                    isCrossBtnShown: true,
                  ),
                ),
              ),

              // Location Details
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Location Status
                      if (state is LocationLoading) ...[
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                              height: 20.w,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.primary,
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              tr('store_details.delivery.location.getting_location'),
                              style: AppStyles.bodyText2,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                      ],

                      // Selected Location
                      if (state is LocationSelected) ...[
                        Text(
                          state.address,
                          style: AppStyles.bodyText1.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16.h),
                      ],

                      // Extra Details Input
                      Text(
                        tr('store_details.delivery.location.extra_details'),
                        style: AppStyles.bodyText2.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextField(
                        controller: viewModel.extraDetailsController,
                        decoration: InputDecoration(
                          hintText: tr('store_details.delivery.location.building_hint'),
                          hintStyle: AppStyles.bodyText2.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                        ),
                        onChanged: viewModel.onExtraDetailsChanged,
                      ),
                      SizedBox(height: 16.h),

                      // Save Location Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: viewModel.saveLocation,
                            onChanged: (value) =>
                                viewModel.onSaveLocationChanged(value ?? false),
                            activeColor: AppColors.primary,
                          ),
                          Expanded(
                            child: Text(
                              tr('store_details.delivery.location.save_location'),
                              style: AppStyles.bodyText2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Confirm Button
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          onPressed: state is LocationSelected ? () {
                            Navigator.pop(context, {
                              'address': state.address,
                              'latitude': state.position.latitude,
                              'longitude': state.position.longitude,
                              'extraDetails': viewModel.extraDetailsController.text,
                            });
                          } : null,
                          backgroundColor: AppColors.primary,
                          borderSideColor: AppColors.primary,
                          borderRadius: 8.r,
                          child: Text(
                            tr('store_details.delivery.location.confirm_location'),
                            style: AppStyles.buttonText.copyWith(
                              fontSize: 16.sp,
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
