import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../../../profile_tab/data/models/get_user_profile_model.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final Data userProfile;

  const ProfileHeaderWidget({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.25,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8),
          ],
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            // Background design elements
            Positioned(
              top: -30,
              right: -30,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            
            // Profile content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile image
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.w,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.r),
                      child: CachedNetworkImage(
                        imageUrl: userProfile.imageUrl ?? '',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: AppColors.lightGrey,
                          child: Icon(
                            Icons.person,
                            size: 40.sp,
                            color: AppColors.grey,
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: AppColors.lightGrey,
                          child: Icon(
                            Icons.person,
                            size: 40.sp,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 10.h),
                  
                  // Name and verification badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userProfile.name ?? 'profile_tab.user'.tr(),
                        style: AppStyles.header3.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (userProfile.isVerified == true)
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Icon(
                            Icons.verified,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                    ],
                  ),
                  
                  SizedBox(height: 5.h),
                  
                  // Email
                  Text(
                    userProfile.email ?? '',
                    style: AppStyles.bodyText2.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  
                  SizedBox(height: 5.h),
                  
                  // Phone
                  Text(
                    userProfile.phone ?? '',
                    style: AppStyles.bodyText2.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
