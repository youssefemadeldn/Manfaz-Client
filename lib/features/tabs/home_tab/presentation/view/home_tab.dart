import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/home_category_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Services Categories',
                  style: AppStyles.header3.copyWith(
                    color: AppColors.black,
                  ),
                ),
                SizedBox(
                  height: 0.h,
                ),
                SizedBox(
                  height: 350.h,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    children: [
                      HomeCategoryItem(
                        title: 'Home\nMaintenance',
                        image: 'assets/images/home_maintenance.png',
                      ),
                      HomeCategoryItem(
                          title: 'Technical\nMaintenance',
                          image: 'assets/images/technical_maintenance.png'),
                      HomeCategoryItem(
                          title: 'Repair\n& Installation',
                          image: 'assets/images/repair_and_installation.png'),
                      HomeCategoryItem(
                          title: 'Personal\nSupport',
                          image: 'assets/images/personal_support.png'),
                      HomeCategoryItem(
                          title: 'Professional\nServices',
                          image: 'assets/images/professional_services.png'),
                      HomeCategoryItem(
                        title: 'Delivery',
                        image: 'assets/images/cash_on_delivery.png',
                      ),
                      HomeCategoryItem(
                          title: 'Professional\nServices',
                          image: 'assets/images/professional_services.png'),
                      HomeCategoryItem(
                        title: 'Delivery',
                        image: 'assets/images/cash_on_delivery.png',
                      ),
                      HomeCategoryItem(
                          title: 'Personal\nSupport',
                          image: 'assets/images/personal_support.png'),
                      HomeCategoryItem(
                          title: 'Professional\nServices',
                          image: 'assets/images/professional_services.png'),
                      HomeCategoryItem(
                        title: 'Delivery',
                        image: 'assets/images/cash_on_delivery.png',
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
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              'assets/images/motor.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 100.h,
                            right: 10.w,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    AppColors.primary.withOpacity(0.55),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                              ),
                              child: Text(
                                'explore',
                                style: AppStyles.smallText.copyWith(
                                  color: AppColors.white,
                                  fontSize: 12.sp,
                                ),
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
        ),
      ],
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.white,
          width: 1.w,
        ),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none_rounded,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

 // Row(
                //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Icon(Icons.location_on_outlined),
                //     SizedBox(
                //       width: 10.w,
                //     ),
                //     Text(
                //       'Egypt',
                //       style: AppStyles.header1,
                //     ),
                //     SizedBox(
                //       width: 10.w,
                //     ),
                //     Icon(Icons.keyboard_arrow_down_outlined),
                //   ],
                // ),
                // SizedBox(
                //   height: 25.h,
                // ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: TextField(
                //         textInputAction: TextInputAction.search,
                //         decoration: InputDecoration(
                //           hintText: 'Find the service you want',
                //           border: const OutlineInputBorder(
                //             borderSide: BorderSide(
                //               color: Colors.black,
                //               width: 1.3,
                //             ),
                //           ),
                //           enabledBorder: const OutlineInputBorder(
                //             borderSide: BorderSide(
                //               color: Colors.black,
                //               width: 1.3,
                //             ),
                //           ),
                //           focusedBorder: const OutlineInputBorder(
                //             borderSide: BorderSide(
                //               color: Colors.black,
                //               width: 1.3,
                //             ),
                //           ),
                //           prefixIcon: const Icon(
                //             Icons.search,
                //             color: Colors.black,
                //           ),
                //           prefixIconConstraints: const BoxConstraints(
                //             minWidth: 40,
                //             minHeight: 20,
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 10.w,
                //     ),
                //     ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: AppColors.black,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(5.r),
                //           side: const BorderSide(
                //             color: AppColors.black,
                //             width: 1.3,
                //           ),
                //         ),
                //         minimumSize: Size(20.w, 35.h),
                //       ),
                //       onPressed: () {},
                //       child: Icon(
                //         Icons.tune,
                //         size: 30.sp,
                //         color: AppColors.white,
                //       ),
                //     ),
                //   ],
                // ),