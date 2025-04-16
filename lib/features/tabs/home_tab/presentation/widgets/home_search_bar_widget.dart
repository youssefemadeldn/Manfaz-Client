import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/bottom_sheet_helper.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../profile_tab/data/models/get_user_profile_model.dart';
import '../controller/search_bar_cubit/search_bar_cubit.dart';
import 'bottom_sheets/home_saved_addresses_bottom_sheet.dart';


class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({super.key,  this.userProfile});
  final Data ?userProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w, bottom: 20.h),
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.95),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Text
            Text(
              context.read<SearchBarCubit>().welcomeMessageWithUserName,
              style: AppStyles.header1.copyWith(
                color: AppColors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),

            SizedBox(height: 20.h),

            // Search TextField with Location inside
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Container(
                    padding: EdgeInsets.all(12.w),
                    child: Icon(
                      Icons.search,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () async {
                      BottomSheetHelper.show(
                        context: context,
                        child: HomeSavedAddressesBottomSheet(
                          addNewAddress: () async {
                            await Navigator.pushNamed(context, Routes.getUserLocationView);
                      // Refresh address from cache when returning from location selection
                      // ignore: use_build_context_synchronously
                      context.read<SearchBarCubit>().refreshAddressFromCache();
                          },
                          // locations: context.read<SearchBarCubit>().locations,
                          locations: userProfile?.locations,
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2  .w),
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.primary,
                            size: 24.sp,
                          ),
                          SizedBox(width: 4.w),
                          BlocBuilder<SearchBarCubit, SearchBarState>(
                            builder: (context, state) {
                              if (state is SearchBarLoading) {
                                return SizedBox(
                                  width: 12.w,
                                  height: 12.h,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                                  ),
                                );
                              } else if (state is SearchBarLoaded &&
                                  state.address.isNotEmpty) {
                                return Text(
                                  state.address.split(',').last,
                                  style: AppStyles.bodyText2.copyWith(
                                    color: AppColors.primary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                );
                              } else if (state is SearchBarError) {
                                return Text(
                                  tr('home.location_error'),
                                  style: AppStyles.bodyText2.copyWith(
                                    color: AppColors.primary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              }
                              return Text(
                                tr('home.get_location'),
                                style: AppStyles.bodyText2.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 2.w),
                          SvgPicture.asset(
                            'assets/svg/arrow_down.svg',
                            color: AppColors.primary,
                            width: 10.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  hintText: tr('home.search_hint'),
                  hintStyle: AppStyles.bodyText2.copyWith(
                    color: AppColors.darkGrey.withOpacity(0.7),
                    fontSize: 14.sp,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                ),
                style: AppStyles.bodyText2.copyWith(
                  color: AppColors.darkGrey,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
