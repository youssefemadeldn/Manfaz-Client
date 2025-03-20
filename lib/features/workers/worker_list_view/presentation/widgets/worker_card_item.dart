import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';
import 'package:manfaz/features/workers/worker_list_view/presentation/widgets/skill_chip.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../data/models/worker_list_model.dart';
import 'available_now_status.dart';

class WorkerCardItem extends StatelessWidget {
  final VoidCallback onPressed;
  final WorkerLite worker;
  const WorkerCardItem({
    super.key,
    required this.worker,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context, 
          Routes.workerProfileView,
          arguments: worker.id.toString(),
        );
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
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: worker.isAvailable!
                              ? AppColors.accentGreen.withOpacity(0.5)
                              : AppColors.grey.withOpacity(0.5),
                          width: 2,
                        ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: worker.profileImage ?? '',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Image.network('https://static.vecteezy.com/system/resources/previews/020/765/399/non_2x/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg',
                            // width: 80.w,
                            height: 80.h),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundImage: imageProvider,
                          radius: 80.r,
                        ),
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
                          color: worker.isAvailable!
                              ? AppColors.accentGreen
                              : AppColors.grey,
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
                                  worker.user?.name ?? '',
                                  style: AppStyles.listTileTitle.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  worker.title ?? '',
                                  style: AppStyles.listTileSubtitle,
                                ),
                              ],
                            ),
                          ),
                          // // Favorite Button
                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: AppColors.secondaryMuted,
                          //     borderRadius: BorderRadius.circular(12.r),
                          //   ),
                          //   padding: EdgeInsets.all(8.w),
                          //   child: Icon(
                          //     Icons.favorite_border,
                          //     color: AppColors.secondary,
                          //     size: 20.w,
                          //   ),
                          // ),
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
                          Expanded(
                            child: Text(
                              worker.user?.locations?[0].address ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.caption.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          AvailableNowStatus(
                            availableNow: worker.isAvailable ?? false,
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
              worker.description ?? '',
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
              children: worker.skills!.map((e) => SkillChip(skill: e)).toList(),
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
                              text: worker.rating.toString(),
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
                      percent: worker.jobSuccessRate?.toDouble() ?? 0,
                      center: Text(
                        worker.jobSuccessRate.toString(),
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
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryMuted,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    '\$${worker.totalEarned}K+ earned',
                    style: AppStyles.caption.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 80.w),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    borderRadius: 20.r,
                    backgroundColor: AppColors.primary,
                    onPressed: onPressed,
                    child: Text(
                      "Order Now",
                      style: AppStyles.buttonText,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
