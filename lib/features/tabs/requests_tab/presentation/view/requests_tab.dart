import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';

class RequestsTab extends StatelessWidget {
  const RequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Requests',
              style: AppStyles.font24BlackBold,
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ButtonsTabBar(
                      // Customize the appearance and behavior of the tab bar
                      backgroundColor: AppColors.black,
                      borderWidth: 2,
                      // buttonMargin: EdgeInsets.zero,
                      borderColor: Colors.black,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      // Add your tabs here
                      tabs: [
                        Tab(text: '  All  '),
                        Tab(text: 'Previous'),
                        Tab(text: 'Completed'),
                        Tab(text: 'Canceled'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          ListView.builder(
                            itemBuilder: (context, i) => Card(
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'House Cleaning',
                                          style: AppStyles.font20BlackBold,
                                        ),
                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 7.w,
                                            vertical: 5.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.lightBrown,
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Text(
                                            'In progress',
                                            style: AppStyles.font10WhiteBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // December 25, 2024 – 3:00 PM

                                    Text(
                                      'December 25, 2024',
                                      style: AppStyles.font14LightGreyRegular,
                                    ),
                                    Text('Riyadh',
                                        style:
                                            AppStyles.font14LightGreyRegular),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    CusTextButton(
                                      buttonText: 'Display Details',
                                      textStyle: AppStyles.font16BlackBold,
                                      onPressed: () {},
                                      backgroundColor: AppColors.white,
                                      verticalPadding: 5.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Center(child: Text('Content for Tab 2')),
                          Center(child: Text('Content for Tab 3')),
                          Center(child: Text('Content for Tab 4')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
