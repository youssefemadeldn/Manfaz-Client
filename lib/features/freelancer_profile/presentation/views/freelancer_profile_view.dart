import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';

class FreelancerProfileView extends StatelessWidget {
  const FreelancerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.green,
            radius: 20.r,
            child: Icon(
              Icons.favorite,
              color: AppColors.lighterGrey,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2016/11/18/19/07/happy-1836445_640.jpg',
                ),
                radius: 80.r,
                backgroundColor: AppColors.green,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'John Doe',
                style: AppStyles.font24BlackBold,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'UX Designer',
                style: AppStyles.font16BlackBold,
              ),
              SizedBox(
                height: 20.h,
              ),
              RateJobTimeExperience(),
              SizedBox(
                height: 20.h,
              ),
              // about me details
              Text(
                'Hi there! I’m John Doe, a passionate UI/UX designer with a knack for turning ideas into beautiful, user-friendly experiences. I thrive on creating designs that don’t just look good but also work effortlessly. With every project, my goal is to bridge the gap between creativity and functionality, making every interaction meaningful and engaging.',
                style: AppStyles.font14LightGreyRegular,
                // maxLines: 3,
                // overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10.h,
              ),

              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ActionDealingWithFreelancers(
                    text: 'Freelancer works only with 100% prepayment.',
                    icon: Icon(
                      Icons.monetization_on,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ActionDealingWithFreelancers(
                    text: 'Communicate and clarify details before hiring',
                    icon: Icon(
                      Icons.chat,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ActionDealingWithFreelancers(
                    text: ' Directly start the project with the freelancer',
                    icon: Icon(
                      Icons.handshake,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              ),
              Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CusTextButton(
                    buttonText: 'Hire',
                    textStyle: AppStyles.font14BlackBold,
                    onPressed: () {},
                    buttonWidth: 100.w,
                    buttonHeight: 30.h,
                    backgroundColor: AppColors.lemon,
                    verticalPadding: 5.h,
                    borderSideColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CusTextButton(
                    buttonText: 'Contact',
                    textStyle: AppStyles.font14BlackBold,
                    onPressed: () {},
                    buttonWidth: 100.w,
                    buttonHeight: 30.h,
                    backgroundColor: AppColors.white,
                    verticalPadding: 5.h,
                    borderSideColor: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionDealingWithFreelancers extends StatelessWidget {
  final String text;
  final Icon icon;
  const ActionDealingWithFreelancers({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.lighterGrey,
      ),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 10.w,
          ),
          Text(
            text,
            style: AppStyles.font14BlackMedium,
          ),
        ],
      ),
    );
  }
}

class RateJobTimeExperience extends StatelessWidget {
  const RateJobTimeExperience({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          color: Color(0XFFEDEBE7),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              children: [
                Icon(
                  Icons.star_border_rounded,
                  // color: Colors.yellow,
                  size: 32.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '4.9',
                  style: AppStyles.font15BlackBold,
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          color: Color(0XFFEDEBE7),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              children: [
                Icon(
                  Icons.alarm_sharp,
                  // color: Colors.yellow,
                  size: 30.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Part Time',
                  style: AppStyles.font15BlackBold,
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          color: Color(0XFFEDEBE7),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              children: [
                Icon(
                  Icons.work_history_outlined,
                  // color: Colors.yellow,
                  size: 30.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '5+years',
                  style: AppStyles.font15BlackBold,
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
