import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/home_category_item.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/service_card_item.dart';

import '../../../../../core/helper/bottom_sheet_helper.dart';
import '../widgets/home_search_bar_widget.dart';

import 'package:easy_localization/easy_localization.dart';

import '../widgets/posters_list.dart';

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
                  Text(
                    tr('home.daily_solutions'),
                    style: AppStyles.header1.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    height: 370.h,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        // childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) => ServiceCardItem(
                        image:
                            'assets/images/food_and_drinks-removebg-preview.png',
                        title: tr('home.food_and_drinks'),
                        supTitle: tr('home.restaurant_coffee_drinks'),
                        price: tr('home.price_range'),
                      ),
                      itemCount: 10,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SeeAllWidget(),
                      Text(
                        " ${tr('home.choose_service')} ",
                        style: AppStyles.header1.copyWith(
                          color: AppColors.textPrimary,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
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
                              onTap: () {
                                BottomSheetHelper.show(
                                  context: context,
                                  maxHeight: 280.h,
                                  child: HomeBottomSheetChildWidget(),
                                );
                              },
                              title: '${tr('home.categories')} $index',
                              image:
                                  'assets/images/repair_and_installation.png',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  PostersList(
                    title: tr('home.beauty_health'),
                    image: 'assets/images/beauty-banner-.jpg',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  PostersList(
                    title: tr('home.best_seller'),
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

class HomeBottomSheetChildWidget extends StatelessWidget {
  const HomeBottomSheetChildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      width: double.infinity,
      child: GridView.builder(
          itemCount: 5,
          padding: EdgeInsets.all(5.r),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            return HomeCategoryItem(
              title: 'title',
              image: 'assets/images/repair_and_installation.png',
              onTap: () {},
            );
          }),
    );
  }
}
