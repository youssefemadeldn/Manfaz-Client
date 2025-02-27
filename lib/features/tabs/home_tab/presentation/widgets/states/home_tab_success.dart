import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/features/tabs/home_tab/data/models/home_tab_model.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/quick_action_item.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/helper/bottom_sheet_helper.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../../data/models/services_based_on_category_model.dart';
import '../../controller/services_cubit/services_cubit.dart';
import '../home_bottom_sheet_child_widget.dart';
import '../items/service_card_item.dart';
import '../items/delivery_card_item.dart';

class HomeTabSuccess extends StatelessWidget {
  final List<CategoryModel> categoriesDeliveryList;
  final List<ServiceModel> categoriesServiceList;
  const HomeTabSuccess(
      {super.key,
      required this.categoriesDeliveryList,
      required this.categoriesServiceList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Quick Actions
        Text(
          tr('home.quick_actions'),
          style: AppStyles.header1.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 16.h),

        SizedBox(
          height: 100.h,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              //   QuickActionItem(
              //     icon: Icons.home_repair_service,
              //     label: tr('home.services'),
              //     color: Colors.orange,
              //     onTap: () {
              //       // Handle services section
              //     },
              //   ),
              //   SizedBox(
              //     width: 20.w,
              //   ),
              //     QuickActionItem(
              //   icon: Icons.delivery_dining,
              //   label: tr('home.delivery'),
              //   color: AppColors.primary,
              //   onTap: () {
              //     // Handle delivery section
              //   },
              // ),
              //   SizedBox(
              //     width: 20.w,
              //   ),
              QuickActionItem(
                icon: Icons.engineering,
                label: tr('home.not_available_service'),
                color: AppColors.green,
                onTap: () {
                  // Handle delivery section
                },
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // Popular Services
        Text(
          tr('home.popular_services'),
          style: AppStyles.header1.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesDeliveryList.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: DeliveryCardItem(
                categoryModel: categoriesDeliveryList[index],
                onTap: () {
                  Navigator.pushNamed(context, Routes.deliveryListViewView);
                },
              ),
            ),
          ),
        ),

        SizedBox(height: 24.h),

        // Categories Grid
        Text(
          tr('home.all_categories'),
          style: AppStyles.header1.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        // SizedBox(height: 5.h),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: categoriesServiceList.length,
          itemBuilder: (context, index) => ServiceCardItem(
            serviceModel: ServiceModel(
              id: categoriesServiceList[index].id!,
              name: categoriesServiceList[index].name,
              iconUrl: categoriesServiceList[index].imageUrl,
            ),
            onTap: () {
              BottomSheetHelper.show(
                context: context,
                maxHeight: 280.h,
                child: BlocProvider(
                  create: (context) => getIt<ServicesCubit>()..emitGetAllServicesStates(
                        categoriesServiceList[index].id!,
                        categoriesServiceList[index].type!,
                        ),
                  child: HomeBottomSheetChildWidget(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // String _getPopularServiceTitle(int index) {
  //   switch (index) {
  //     case 0:
  //       return tr('home.food_delivery');
  //     case 1:
  //       return tr('home.home_cleaning');
  //     case 2:
  //       return tr('home.ac_repair');
  //     case 3:
  //       return tr('home.plumbing');
  //     case 4:
  //       return tr('home.grocery');
  //     default:
  //       return '';
  //   }
  // }

  // String _getPopularServiceSubtitle(int index) {
  //   switch (index) {
  //     case 0:
  //       return tr('home.restaurants_cafes');
  //     case 1:
  //       return tr('home.professional_cleaning');
  //     case 2:
  //       return tr('home.ac_maintenance');
  //     case 3:
  //       return tr('home.plumbing_services');
  //     case 4:
  //       return tr('home.supermarket_delivery');
  //     default:
  //       return '';
  //   }
  // }

  // String _getCategoryTitle(int index) {
  //   switch (index) {
  //     case 0:
  //       return tr('home.food');
  //     case 1:
  //       return tr('home.maintenance');
  //     case 2:
  //       return tr('home.cleaning');
  //     case 3:
  //       return tr('home.grocery');
  //     case 4:
  //       return tr('home.laundry');
  //     case 5:
  //       return tr('home.electronics');
  //     case 6:
  //       return tr('home.pharmacy');
  //     case 7:
  //       return tr('home.more');
  //     default:
  //       return '';
  //   }
  // }

  // String _getCategoryImage(int index) {
  //   // Replace with actual image assets
  //   return 'assets/images/food_and_drinks-removebg-preview.png';
  // }
}
