import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/features/workers/worker_list_view/presentation/widgets/skill_chip.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class WorkerCardItem extends StatelessWidget {
  const WorkerCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.workerProfileView);
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.primaryLight.withOpacity(0.15)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image with Status Badge
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.accentGreen.withOpacity(0.5),
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2016/11/18/19/07/happy-1836445_640.jpg',
                        ),
                        radius: 40.r,
                        backgroundColor: AppColors.primary,
                      ),
                    ),
                    // Online Status Badge
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 24.h,
                        width: 24.w,
                        decoration: BoxDecoration(
                          color: AppColors.accentGreen,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.surface,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'John Doe',
                                  style: AppStyles.listTileTitle.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'UX Designer',
                                  style: AppStyles.listTileSubtitle,
                                ),
                              ],
                            ),
                          ),
                          // Favorite Button
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.secondaryMuted,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            padding: EdgeInsets.all(8.w),
                            child: Icon(
                              Icons.favorite_border,
                              color: AppColors.secondary,
                              size: 20.w,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      // Location and Available Now
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.primary,
                            size: 16.w,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'New York, USA',
                            style: AppStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.accentGreen.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: AppColors.accentGreen,
                                  size: 8.w,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'Available Now',
                                  style: AppStyles.caption.copyWith(
                                    color: AppColors.accentGreen,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Description
            Text(
              'UX Designer with 5 years of experience in UI/UX design and a strong skilled in creating intuitive, user-centered digital experiences',
              style: AppStyles.bodyText1.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 16.h),
            // Skills Row
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                SkillChip(skill: 'Dart'),
                SkillChip(skill: 'Flutter'),
                SkillChip(skill: 'Firebase'),
                SkillChip(skill: 'Mobile App Development'),
                SkillChip(skill: '+10'),
              ],
            ),
            SizedBox(height: 16.h),
            // Bottom Row with Price, Success Rate and Total Earned
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price Container
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: AppColors.primary,
                        size: 18.w,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '12',
                              style: AppStyles.buttonTextPrimary.copyWith(
                                fontSize: 16.sp,
                              ),
                            ),
                            TextSpan(
                              text: '/hr',
                              style: AppStyles.caption.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Job Success Rate
                Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 16.r,
                      lineWidth: 3.0,
                      percent: 0.95,
                      center: Text(
                        "95%",
                        style: AppStyles.caption.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      progressColor: AppColors.accentGreen,
                      backgroundColor: AppColors.accentGreen.withOpacity(0.2),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Job Success',
                      style: AppStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            // Total Earned
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.secondaryMuted,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                '\$4K+ earned',
                style: AppStyles.caption.copyWith(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
