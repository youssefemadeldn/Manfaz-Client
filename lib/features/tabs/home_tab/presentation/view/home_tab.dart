import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/home_category_item.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/notification_icon_button.dart';

import '../widgets/see_all_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeSearchBarWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 0.h,
                  ),
                  Card(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        SeeAllWidget(),
                        SizedBox(
                          height: 210.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5.h,
                              crossAxisSpacing: 5.w,
                              childAspectRatio: 1,
                            ),
                            itemCount: 14, // Number of categories
                            itemBuilder: (context, index) {
                              return HomeCategoryItem(
                                title: 'Category $index',
                                image:
                                    'assets/images/professional_services.png', // Replace with your actual asset path
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Popular Services',
                    style: AppStyles.header2.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (itemContext, index) => Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(35.r),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1275782186/vector/repairman-fixing-appliances-at-home-and-happy-customer.jpg?s=612x612&w=0&k=20&c=M_9aHclse5YY1X-az1jd3T8RVd9XMDfL3qnyCepGI0c=',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
      width: double.maxFinite,
      color: AppColors.primary,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Ahmed👋',
              style: AppStyles.bodyText2.copyWith(
                color: AppColors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lets find best\nservice for you',
                  style: AppStyles.header1,
                ),
                NotificationButton(),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            // Search Text Field
            TextField(
              decoration: InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.primary,
                ),
                hintText: 'What are you looking for?',
                hintStyle: AppStyles.bodyText2,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
