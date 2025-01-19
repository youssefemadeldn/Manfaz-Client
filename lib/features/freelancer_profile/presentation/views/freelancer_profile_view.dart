import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';

import '../../../../core/routes/routes.dart';
import '../widgets/action_dealing_with_freelancers.dart';
import '../widgets/rate_job_time_experience.dart';

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
              color: AppColors.secondary,
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
                style: AppStyles.bodyText1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'UX Designer',
                style: AppStyles.bodyText2,
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
                style: AppStyles.caption,
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
                    textStyle: AppStyles.buttonText,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.sendAnOfferView);
                    },
                    buttonWidth: 100.w,
                    buttonHeight: 30.h,
                    backgroundColor: AppColors.primary,
                    verticalPadding: 5.h,
                    borderSideColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CusTextButton(
                    buttonText: 'Contact',
                    textStyle: AppStyles.buttonText,
                    onPressed: () {},
                    buttonWidth: 100.w,
                    buttonHeight: 30.h,
                    backgroundColor: AppColors.secondary,
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
