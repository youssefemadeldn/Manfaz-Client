import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/features/tabs/home_tab/data/models/home_tab_model.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/items/service_card_item.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../controller/home_tab_cubit/home_tab_cubit.dart';
import 'states/home_tab_error.dart';
import 'un_available_services.dart';

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
          } else if (state is ServiceBottomSheetSuccessState) {
            var list = state.servicesBasedOnCategoryModel.data;
            if (list?.isEmpty ?? true) {
              return const UnAvailableServices();
            }
            return  GridView.builder(
                itemCount: list?.length ?? 3,
                padding: EdgeInsets.all(5.r),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return  ServiceCardItem(
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
          } else if (state is ServiceBottomSheetErrorState) {
            return ErrorMessageWidget(
              errorMessage: state.failure.errorMessage,
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

