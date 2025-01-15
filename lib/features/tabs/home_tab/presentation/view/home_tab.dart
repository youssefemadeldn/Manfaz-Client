import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/home_category_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Ahmed',
              style: AppStyles.font24BlackBold,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Egypt',
                  style: AppStyles.font24BlackBold,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Icon(Icons.keyboard_arrow_down_outlined),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    // textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'Find the service you want',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.3,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.3,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.3,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      side: const BorderSide(
                        color: AppColors.black,
                        width: 1.3,
                      ),
                    ),
                    minimumSize: Size(20.w, 35.h),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.tune,
                    size: 30.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Categories',
              style: AppStyles.font24BlackBold,
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 250.h,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  HomeCategoryItem(
                    title: 'Home Maintenance',
                    image: 'assets/images/home_maintenance.png',
                  ),
                  HomeCategoryItem(
                      title: 'Technical Maintenance',
                      image: 'assets/images/technical_maintenance.png'),
                  HomeCategoryItem(
                      title: 'Repair and Installation',
                      image: 'assets/images/repair_and_installation.png'),
                  HomeCategoryItem(
                      title: 'Personal Support',
                      image: 'assets/images/personal_support.png'),
                  HomeCategoryItem(
                      title: 'Professional Services',
                      image: 'assets/images/professional_services.png'),
                  HomeCategoryItem(
                    title: 'Delivery',
                    image: 'assets/images/cash_on_delivery.png',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Special Offers',
              style: AppStyles.font24BlackBold,
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (itemContext, index) => Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          'assets/images/motor.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10.h,
                        left: 10.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.brown,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Text(
                                '10% OFF',
                                style: AppStyles.font10WhiteBold,
                              ),
                            ),
                            // SizedBox(
                            //   height: 10.h,
                            // ),
                            // Container(
                            //     padding: EdgeInsets.symmetric(
                            //       horizontal: 10.w,
                            //       vertical: 5.h,
                            //     ),
                            //     decoration: BoxDecoration(
                            //       color: AppColors.brown,
                            //       borderRadius: BorderRadius.circular(5.r),
                            //     ),
                            //     child: Text(
                            //       'includes\ncleaning and maintenance',
                            //       style: AppStyles.font10WhiteBold,
                            //     ),
                            //   ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 100.h,
                        right: 10.w,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                          child: Text(
                            'Book Now',
                            style: AppStyles.font10WhiteBold,
                          ),
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
    );
  }
}
