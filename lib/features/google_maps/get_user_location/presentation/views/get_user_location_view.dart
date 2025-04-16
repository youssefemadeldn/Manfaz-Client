import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:manfaz/core/di/di.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/google_maps/save_user_location/presentation/cubit/save_location_cubit.dart';
import 'package:manfaz/features/google_maps/save_user_location/presentation/widgets/location_details_card.dart';
import '../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../core/routes/routes.dart';
import '../../data/models/save_user_location_response_model.dart';
import '../controller/get_user_location_cubit/get_user_location_cubit.dart';

class GetUserLocationView extends StatelessWidget {
  const GetUserLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<GetUserLocationCubit>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<SaveLocationCubit>(
          create: (context) => getIt<SaveLocationCubit>(),
        ),
      ],
      child: BlocBuilder<GetUserLocationCubit, GetUserLocationState>(
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
                child: LocationDetailsCard(
                  address: viewModel.currentAddress.isEmpty
                      ? tr('home.getting_location')
                      : viewModel.currentAddress,
                  latitude: viewModel.locationData.latitude ?? 0.0,
                  longitude: viewModel.locationData.longitude ?? 0.0,
                  onLocationSaved: (SaveUserLocationResponseModel? response) async {
                    if (response != null) {
                      // Save the selected location to cache
                      await Future.wait([
                        SharedPrefUtils.saveData(
                          key: 'current_address',
                          data: viewModel.currentAddress,
                        ),
                        SharedPrefUtils.saveData(
                          key: 'current_latitude',
                          data: viewModel.locationData.latitude.toString(),
                        ),
                        SharedPrefUtils.saveData(
                          key: 'current_longitude',
                          data: viewModel.locationData.longitude.toString(),
                        ),
                        SharedPrefUtils.saveData(
                          key: 'is_manually_selected_location',
                          data: true,
                        ),
                      ]);
                      
                      // Navigate back to the home screen
                      Navigator.pushReplacementNamed(
                        context, 
                        Routes.cusBottomNavigationBar,
                      );
                    }
                  },
                  onCancel: () {
                    Navigator.pushReplacementNamed(
                      context, 
                      Routes.cusBottomNavigationBar,
                    );
                  },
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
    ),
    );
  }
}
