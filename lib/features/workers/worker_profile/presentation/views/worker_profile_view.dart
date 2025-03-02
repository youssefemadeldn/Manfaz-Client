import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/ArrowBackIosButton.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../worker_list_view/presentation/widgets/available_now_status.dart';

class WorkerProfileView extends StatelessWidget {
  const WorkerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Profile Image
          SliverAppBar(
            expandedHeight: 300.h,
            pinned: true,
            leading: ArrowBackIosButton(),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Profile Image
                  Image.network(
                    'https://cdn.pixabay.com/photo/2016/11/18/19/07/happy-1836445_640.jpg',
                    fit: BoxFit.cover,
                  ),
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  // Profile Info
                  Positioned(
                    bottom: 20.h,
                    left: 20.w,
                    right: 20.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'John Doe',
                              style: AppStyles.header2.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Icons.verified,
                              color: AppColors.secondary,
                              size: 24.w,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Senior UX Designer',
                          style: AppStyles.subtitle1.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 16.w,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'New York, USA',
                              style: AppStyles.caption.copyWith(
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            AvailableNowStatus(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
          // Profile Content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats Row
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem(
                          '95%',
                          'Job Success',
                          AppColors.accentGreen,
                        ),
                        _buildDivider(),
                        _buildStatItem(
                          '\$4K+',
                          'Earned',
                          AppColors.secondary,
                        ),
                        _buildDivider(),
                        _buildStatItem(
                          '120+',
                          'Jobs Done',
                          AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // About Section
                  Text(
                    'About',
                    style: AppStyles.header3,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Senior UX Designer with 5+ years of experience in creating intuitive digital experiences. Specialized in user research, wireframing, and prototyping. Passionate about solving complex design challenges and delivering user-centered solutions.',
                    style: AppStyles.bodyText2,
                  ),
                  SizedBox(height: 24.h),
                  // Skills Section
                  Text(
                    'Skills',
                    style: AppStyles.header3,
                  ),
                  SizedBox(height: 12.h),
                  _buildSkillsGrid(),
                  SizedBox(height: 24.h),
                  // Experience Section
                  Text(
                    'Experience',
                    style: AppStyles.header3,
                  ),
                  SizedBox(height: 12.h),
                  _buildExperienceList(),
                  SizedBox(height: 24.h),
                  // Education Section
                  Text(
                    'Education',
                    style: AppStyles.header3,
                  ),
                  SizedBox(height: 12.h),
                  _buildEducationList(),
                  SizedBox(height: 24.h),
                  // Reviews Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews',
                        style: AppStyles.header3,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View All',
                          style: AppStyles.header3.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  _buildReviewsList(),
                  SizedBox(height: 32.h),
                  // Contact Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        buttonWidth: 150.w,
                        onPressed: () {},
                        borderSideColor: AppColors.primary,
                        backgroundColor: AppColors.primary,
                        child: Text(
                          'Order Now',
                          style: AppStyles.buttonText,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      CustomButton(
                        buttonWidth: double.minPositive,
                        onPressed: () {},
                        borderSideColor: AppColors.primary,
                        backgroundColor: AppColors.primary,
                        child: SvgPicture.asset(
                          'assets/images/worker_profile/cart.svg',
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: AppStyles.header3.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: AppStyles.caption.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40.h,
      width: 1,
      color: AppColors.divider,
    );
  }

  Widget _buildSkillsGrid() {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: [
        _buildSkillChip('UI/UX Design', 0.9),
        _buildSkillChip('Wireframing', 0.85),
        _buildSkillChip('Prototyping', 0.8),
        _buildSkillChip('User Research', 0.95),
        _buildSkillChip('Figma', 0.9),
        _buildSkillChip('Adobe XD', 0.85),
      ],
    );
  }

  Widget _buildSkillChip(String skill, double level) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            skill,
            style: AppStyles.caption.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8.w),
          CircularPercentIndicator(
            radius: 8.r,
            lineWidth: 2.0,
            percent: level,
            progressColor: AppColors.primary,
            backgroundColor: AppColors.primary.withOpacity(0.2),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceList() {
    return Column(
      children: [
        _buildExperienceItem(
          'Senior UX Designer',
          'Tech Corp Inc.',
          '2020 - Present',
          'Led the UX team in redesigning the company\'s flagship product, resulting in a 40% increase in user engagement.',
        ),
        SizedBox(height: 16.h),
        _buildExperienceItem(
          'UX Designer',
          'Design Studio',
          '2018 - 2020',
          'Collaborated with cross-functional teams to deliver user-centered design solutions for various clients.',
        ),
      ],
    );
  }

  Widget _buildExperienceItem(
    String position,
    String company,
    String period,
    String description,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            position,
            style: AppStyles.subtitle1.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(
                company,
                style: AppStyles.bodyText2.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Text(
                ' • ',
                style: AppStyles.bodyText2,
              ),
              Text(
                period,
                style: AppStyles.bodyText2,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: AppStyles.bodyText2,
          ),
        ],
      ),
    );
  }

  Widget _buildEducationList() {
    return Column(
      children: [
        _buildEducationItem(
          'Master of Design',
          'Design University',
          '2016 - 2018',
          'Specialized in User Experience Design',
        ),
        SizedBox(height: 16.h),
        _buildEducationItem(
          'Bachelor of Arts',
          'Creative College',
          '2012 - 2016',
          'Major in Digital Design',
        ),
      ],
    );
  }

  Widget _buildEducationItem(
    String degree,
    String institution,
    String period,
    String description,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.secondary.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            degree,
            style: AppStyles.subtitle1.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(
                institution,
                style: AppStyles.bodyText2.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              Text(
                ' • ',
                style: AppStyles.bodyText2,
              ),
              Text(
                period,
                style: AppStyles.bodyText2,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: AppStyles.bodyText2,
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsList() {
    return Column(
      children: [
        _buildReviewItem(
          'Sarah Johnson',
          'https://randomuser.me/api/portraits/women/1.jpg',
          4.8,
          'Exceptional work! John delivered the project ahead of schedule and exceeded our expectations.',
          'Mobile App Redesign',
          '\$2,500',
        ),
        SizedBox(height: 16.h),
        _buildReviewItem(
          'Michael Chen',
          'https://randomuser.me/api/portraits/men/1.jpg',
          5.0,
          'Outstanding attention to detail and great communication throughout the project.',
          'Website UX Audit',
          '\$1,800',
        ),
      ],
    );
  }

  Widget _buildReviewItem(
    String clientName,
    String clientImage,
    double rating,
    String comment,
    String projectTitle,
    String amount,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.divider,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: NetworkImage(clientImage),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clientName,
                      style: AppStyles.subtitle2.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          rating.toString(),
                          style: AppStyles.caption.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    style: AppStyles.subtitle2.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    projectTitle,
                    style: AppStyles.caption,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            comment,
            style: AppStyles.bodyText2,
          ),
        ],
      ),
    );
  }
}
