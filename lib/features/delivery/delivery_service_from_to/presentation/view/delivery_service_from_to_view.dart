import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cache/shared_pref_utils.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../google_maps/get_location_from_to/presentation/views/get_location_from_to_view.dart';
import '../../../../google_maps/get_location_from_to/presentation/controller/google_maps_cubit/get_location_from_to_cubit.dart';
import '../controller/cubit/delivery_service_from_to_cubit.dart';

class DeliveryServiceFromToView extends StatelessWidget {
  const DeliveryServiceFromToView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 300.h,
                pinned: true,
                backgroundColor: AppColors.primary,
                leading: IconButton(
                  icon: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back_ios,
                        color: Colors.white, size: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                ).animate().fadeIn(delay: 300.ms).slideX(),
                actions: [
                  // IconButton(
                  //   icon: Container(
                  //     padding: EdgeInsets.all(8.w),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white.withOpacity(0.2),
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: const Icon(Icons.share, color: Colors.white, size: 20),
                  //   ),
                  //   onPressed: () {},
                  // ).animate().fadeIn(delay: 400.ms).slideX(),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'https://img.freepik.com/free-photo/front-view-male-courier-blue-uniform-cap-with-food-box-his-hands-smiling-light-pink-wall_140725-38770.jpg?t=st=1741149242~exp=1741152842~hmac=715b1ff290235024c9c8e740d91372ce2ea1573ab5b64ad3b5e5dff8eda09452&w=1380',
                        fit: BoxFit.cover,
                      ).animate().fadeIn(duration: 800.ms),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.6),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: Offset(0, 20.h),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 80.w,
                                    height: 80.w,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.primary,
                                          AppColors.primary.withOpacity(0.8),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.primary
                                              .withOpacity(0.3),
                                          blurRadius: 15,
                                          offset: const Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.local_shipping_rounded,
                                      color: Colors.white,
                                      size: 35.w,
                                    ),
                                  ).animate().scale(delay: 200.ms),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Express Delivery",
                                          style: AppStyles.header2.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                            .animate()
                                            .fadeIn(delay: 300.ms)
                                            .slideX(),
                                        SizedBox(height: 6.h),
                                        Text(
                                          "Fast and reliable delivery service at your fingertips",
                                          style: AppStyles.bodyText2.copyWith(
                                            color: AppColors.grey,
                                            height: 1.4,
                                          ),
                                        )
                                            .animate()
                                            .fadeIn(delay: 400.ms)
                                            .slideX(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildStatItem(
                                    "4.9",
                                    "950K+ Reviews",
                                    Icons.star_rounded,
                                    Colors.amber,
                                  ).animate().scale(delay: 500.ms),
                                  _buildDivider(),
                                  _buildStatItem(
                                    "24/7",
                                    "Always Available",
                                    Icons.access_time_rounded,
                                    AppColors.success,
                                  ).animate().scale(delay: 600.ms),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 40.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery Instructions",
                            style: AppStyles.header3.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ).animate().fadeIn(delay: 700.ms),
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                  color: AppColors.divider.withOpacity(0.5)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.03),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Describe your delivery needs",
                                        style: AppStyles.bodyText1.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        color:
                                            AppColors.primary.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_rounded,
                                        color: AppColors.primary,
                                        size: 22.w,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.h),
                                TextField(
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    hintText:
                                        "E.g., Please deliver my package carefully...",
                                    hintStyle: AppStyles.bodyText2.copyWith(
                                      color: AppColors.grey.withOpacity(0.7),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(
                                        color:
                                            AppColors.divider.withOpacity(0.5),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(
                                        color:
                                            AppColors.divider.withOpacity(0.5),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(
                                        color:
                                            AppColors.primary.withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[50],
                                    contentPadding: EdgeInsets.all(16.w),
                                  ),
                                ),
                              ],
                            ),
                          ).animate().fadeIn(delay: 800.ms).slideY(),
                          SizedBox(height: 24.h),
                          Text(
                            "Location Details",
                            style: AppStyles.header3.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ).animate().fadeIn(delay: 900.ms),
                          SizedBox(height: 12.h),
                          _buildLocationTile(
                            "Pickup Location",
                            "Select pickup point",
                            Icons.location_on_rounded,
                            AppColors.primary,
                            true,
                          ).animate().fadeIn(delay: 1000.ms).slideX(),
                          SizedBox(height: 16.h),
                          _buildLocationTile(
                            "Drop-off Location",
                            "Select destination",
                            Icons.flag_rounded,
                            AppColors.success,
                            false,
                          ).animate().fadeIn(delay: 1100.ms).slideX(),
                          SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: BlocBuilder<DeliveryServiceFromToCubit,
                  DeliveryServiceFromToState>(
                builder: (context, state) {
                  final cubit = context.read<DeliveryServiceFromToCubit>();
                  final hasValidLocations =
                      cubit.fromLat != null && cubit.toLat != null;
                  final costDisplay =
                      hasValidLocations && cubit.deliveryCost != null
                          ? "${cubit.deliveryCost!.toStringAsFixed(2)} EGP"
                          : "--,-- EGP";
                  final distanceDisplay =
                      hasValidLocations && cubit.distanceInKm != null
                          ? "(${cubit.distanceInKm!.toStringAsFixed(1)} km)"
                          : "";

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery Cost",
                                style: AppStyles.bodyText2.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.sp,
                                ),
                              ),
                              if (hasValidLocations &&
                                  cubit.distanceInKm != null)
                                Text(
                                  distanceDisplay,
                                  style: AppStyles.caption.copyWith(
                                    color: AppColors.grey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                            ],
                          ),
                          Text(
                            costDisplay,
                            style: AppStyles.header3.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Delivery cost includes a base fee of ${DeliveryServiceFromToCubit.BASE_PRICE} EGP plus ${DeliveryServiceFromToCubit.PRICE_PER_KM} EGP per kilometer. Minimum delivery cost is ${DeliveryServiceFromToCubit.MIN_PRICE} EGP.",
                        style: AppStyles.caption.copyWith(
                          color: Colors.grey[500],
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: hasValidLocations ? () {} : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            "Place order",
                            style: AppStyles.buttonText.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ).animate().fadeIn(delay: 1200.ms).slideY(begin: 1, end: 0),
        ],
      ),
    );
  }

  Widget _buildStatItem(
      String value, String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24.w),
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: AppStyles.header3.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: AppStyles.bodyText2.copyWith(
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40.h,
      width: 1,
      color: AppColors.divider.withOpacity(0.5),
    );
  }

  Widget _buildLocationTile(String title, String subtitle, IconData icon,
      Color color, bool isPickup) {
    return BlocBuilder<DeliveryServiceFromToCubit, DeliveryServiceFromToState>(
      builder: (context, state) {
        String displayAddress = subtitle;
        if (state is DeliveryServiceFromToLocationSelected) {
          if (isPickup &&
              context.read<DeliveryServiceFromToCubit>().fromAddress != null) {
            displayAddress =
                context.read<DeliveryServiceFromToCubit>().fromAddress!;
          } else if (!isPickup &&
              context.read<DeliveryServiceFromToCubit>().toAddress != null) {
            displayAddress =
                context.read<DeliveryServiceFromToCubit>().toAddress!;
          }
        }

        return InkWell(
          onTap: () async {
            final cubit = context.read<GetLocationFromToCubit>();
            final deliveryCubit = context.read<DeliveryServiceFromToCubit>();
            final result = await Navigator.push<String>(
              context,
              MaterialPageRoute(
                builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: cubit),
                    BlocProvider.value(value: deliveryCubit),
                  ],
                  child: GetLocationFromToView(
                    isFromLocation: isPickup,
                    deliveryServiceFromToCubit: deliveryCubit,
                    getLocationFromToCubit: cubit,
                  ),
                ),
              ),
            );

            if (result != null) {
              if (isPickup) {
                await SharedPrefUtils.saveData(
                    key: 'pickup_location', data: result);
              } else {
                await SharedPrefUtils.saveData(
                    key: 'dropoff_location', data: result);
              }
            }
          },
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppStyles.bodyText2.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        displayAddress,
                        style: AppStyles.bodyText2.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.grey,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
