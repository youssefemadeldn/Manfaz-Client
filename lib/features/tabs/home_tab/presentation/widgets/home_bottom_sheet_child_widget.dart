import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/items/service_card_item.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../data/models/services_based_on_category_model.dart';
import '../controller/services_cubit/services_cubit.dart';
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
      child: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          if (state is ServicesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else if (state is ServicesSuccessState) {
            var servicesList = state.servicesBasedOnCategoryModel.data;
            if (servicesList?.isEmpty ?? true) {
              return const UnAvailableServices();
            }
            return GridView.builder(
                itemCount: servicesList?.length ?? 3,
                padding: EdgeInsets.all(5.r),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return ServiceCardItem(
                    serviceModel: ServiceModel(
                      id: servicesList![index].id!,
                      name: servicesList[index].name,
                      iconUrl: servicesList[index].iconUrl,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.servicesListViewView,
                        arguments: {
                          'categoryId': servicesList[index].categoryId,
                          'type': 'service',
                        },
                      );
                    },
                  );
                });
          } else if (state is ServicesErrorState) {
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
