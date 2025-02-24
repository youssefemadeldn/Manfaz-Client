import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/features/tabs/home_tab/data/models/home_tab_model.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/items/service_card_item.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../controller/home_tab_cubit/home_tab_cubit.dart';
import 'states/home_tab_error.dart';

class HomeBottomSheetChildWidget extends StatelessWidget {
  
  const HomeBottomSheetChildWidget({
    super.key,
  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      width: double.infinity,
      child: BlocBuilder<HomeTabCubit, HomeTabState>(
        builder: (context, state) {
          if (state is ServiceBottomSheetLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }else if(state is ServiceBottomSheetSuccessState){
            var list = state.servicesBasedOnCategoryModel.data;
          return GridView.builder(
              itemCount: list?.length??3,
              padding: EdgeInsets.all(5.r),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return ServiceCardItem(
                  
                  categoryModel: CategoryModel(
                    id: list![index].categoryId!,
                    name: list[index].name,
                    imageUrl: list[index].imageUrl,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.servicesListViewView);
                  },
                );
              });
        
          }else if(state is ServiceBottomSheetErrorState){
            return ErrorMessageWidget(errorMessage: state.failure.errorMessage,);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
  //  String _getPopularServiceTitle(int index) {
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


