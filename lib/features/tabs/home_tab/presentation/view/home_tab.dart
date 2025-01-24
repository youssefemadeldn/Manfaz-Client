import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/home_category_item.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/service_card_item.dart';

import '../widgets/home_search_bar_widget.dart';
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
                    height: 10.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    height: 370.h,
                    child: GridView.builder(
                      // scrollDirection: Axis.,
                      padding: const EdgeInsets.all(0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) => ServiceCardItem(
                        image:
                            'assets/images/food_and_drinks-removebg-preview.png',
                        title: 'Food & Drinks',
                        supTitle: 'Restaurant - Coffee - Drinks',
                        price: '\$ 20.00 - \$ 50.00',
                      ),
                      itemCount: 10,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
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
                            padding: EdgeInsets.all(5.r),
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
                                    'assets/images/repair_and_installation.png', // Replace with your actual asset path
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
                  PostersList(
                    title: 'Beauty & Health',
                    image: 'assets/images/beauty-banner-.jpg',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  PostersList(
                    title: 'Best Seller',
                    image: 'assets/images/banner-.jpg',
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

class PostersList extends StatelessWidget {
  final String title;
  final String image;
  const PostersList({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.header1.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(
          height: 170.h,
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    child: Image.asset(
                      image,
                      height: 150.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

  // ServiceCardItem(
  //                       image: 'assets/images/cap-mockup-removebg-preview.png',
  //                       title: 'Delivery',
  //                       supTitle: 'Shopping - Send - move from anywhere',
  //                       price: '\$ 20.00 - \$ 50.00',
  //                     ),