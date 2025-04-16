import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../get_user_location/data/models/save_user_location_response_model.dart';
import '../cubit/save_location_cubit.dart';
import '../cubit/save_location_state.dart';

class LocationDetailsCard extends StatefulWidget {
  final String address;
  final double latitude;
  final double longitude;
  final Function(SaveUserLocationResponseModel?) onLocationSaved;
  final Function() onCancel;

  const LocationDetailsCard({
    super.key,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.onLocationSaved,
    required this.onCancel,
  });

  @override
  State<LocationDetailsCard> createState() => _LocationDetailsCardState();
}

class _LocationDetailsCardState extends State<LocationDetailsCard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  bool _saveForLaterUse = true;

  @override
  void dispose() {
    _nameController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SaveLocationCubit, SaveLocationState>(
      listener: (context, state) {
        if (state is SaveLocationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(tr('save_location.location_saved')),
              backgroundColor: Colors.green,
            ),
          );
          widget.onLocationSaved(state.saveUserLocationResponseModel);
        } else if (state is SaveLocationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
          widget.onLocationSaved(null);
        }
      },
      builder: (context, state) {
        final cubit = context.read<SaveLocationCubit>();
        
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Location Address Section
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: AppColors.primary),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          widget.address,
                          style: AppStyles.bodyText1.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Location Type Selector
                      _buildLocationTypeSelector(cubit),
                      SizedBox(height: 16.h),
                      
                      // Additional Name Field
                      Text(
                        tr('save_location.additional_name'),
                        style: AppStyles.bodyText2.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextField(
                        controller: _nameController,
                        onChanged: (value) => cubit.setLocationName(value),
                        decoration: InputDecoration(
                          hintText: tr('save_location.additional_name'),
                          hintStyle: TextStyle(fontSize: 14.sp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.grey[300]!),
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
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      
                      // Additional Details Field
                      Text(
                        tr('save_location.additional_details'),
                        style: AppStyles.bodyText2.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextField(
                        controller: _detailsController,
                        onChanged: (value) => cubit.setExtraDetails(value),
                        decoration: InputDecoration(
                          hintText: tr('save_location.building_hint'),
                          hintStyle: TextStyle(fontSize: 14.sp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.grey[300]!),
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
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      
                      // Save for later use switch
                      Row(
                        children: [
                          Switch(
                            value: _saveForLaterUse,
                            onChanged: (value) {
                              setState(() {
                                _saveForLaterUse = value;
                              });
                              cubit.toggleSaveForLaterUse(value);
                            },
                            activeColor: AppColors.primary,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              tr('save_location.save_location'),
                              style: AppStyles.bodyText2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      
                      // Save Button
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: CustomButton(
                          
                          onPressed: state is SaveLocationLoading
                              ? null
                              : () {
                                  cubit.saveUserLocation(
                                    address: widget.address,
                                    latitude: widget.latitude,
                                    longitude: widget.longitude,
                                  );
                                },
                          backgroundColor: AppColors.primary,
                          borderSideColor: AppColors.primary,
                          borderRadius: 8.r,
                          child: state is SaveLocationLoading
                              ? SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.w,
                                  ),
                                )
                              : Text(
                                  tr('save_location.save'),
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
        );
      },
    );
  }

  Widget _buildLocationTypeSelector(SaveLocationCubit cubit) {
    final locationTypes = [
      {'type': 'Home', 'icon': Icons.home},
      {'type': 'Work', 'icon': Icons.work},
      {'type': 'School', 'icon': Icons.school},
      {'type': 'Hotel', 'icon': Icons.hotel},
      {'type': 'Park', 'icon': Icons.park},
      {'type': 'Club', 'icon': Icons.sports_tennis},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('save_location.location_details'),
          style: AppStyles.bodyText1.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 12.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: locationTypes.map((location) {
              final isSelected = cubit.selectedLocationType == location['type'];
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: InkWell(
                  onTap: () => cubit.changeLocationType(location['type'] as String),
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          location['icon'] as IconData,
                          color: isSelected ? Colors.white : Colors.black54,
                          size: 18.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          tr('save_location.${location['type']?.toString().toLowerCase()}'),
                          style: AppStyles.bodyText2.copyWith(
                            color: isSelected ? Colors.white : Colors.black54,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
