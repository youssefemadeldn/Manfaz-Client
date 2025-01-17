import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/routes.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class FreelancerCardItem extends StatelessWidget {
  const FreelancerCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.freelancerProfileView);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.lighterGrey),
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        margin: EdgeInsets.only(bottom: 10.h),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2016/11/18/19/07/happy-1836445_640.jpg',
                  ),
                  radius: 50.r,
                  backgroundColor: AppColors.green,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    Text(
                      'John Doe',
                      style: AppStyles.font16Black600,
                    ),
                    Text(
                      'UX Designer',
                      style: AppStyles.font16lightGrey500,
                    ),
                  ],
                ),
                Spacer(),
                //  OnLine
                Container(
                  height: 30.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: AppColors.lighterGrey,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: AppColors.lemon,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Online',
                      style: AppStyles.font16lightGrey500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'UX Designer with 5 years of experience in UI/UX design and a strong skilled in creating intuitive, user-centered digital experiences',
              style: AppStyles.font12Black400,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                // 12$ per hour & favorite Icon
                Row(
                  children: [
                    Container(
                      height: 30.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$12',
                                style: AppStyles.font16White500,
                              ),
                              TextSpan(
                                text: ' /hour',
                                style: AppStyles.font16lightGrey500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                //  Favorite Icon
                CircleAvatar(
                  backgroundColor: AppColors.green,
                  radius: 20.r,
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.lighterGrey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.lighterGrey,
                ),
                Text(
                  'New York, USA',
                  style: AppStyles.font12lightGrey400,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
