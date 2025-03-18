import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/features/tabs/home_tab/data/models/home_tab_model.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/controller/home_tab_cubit/home_tab_cubit.dart';
import '../../../../../core/di/di.dart';
import '../../data/models/services_based_on_category_model.dart';
import '../widgets/home_search_bar_widget.dart';
import '../widgets/states/home_tab_error.dart';
import '../widgets/states/home_tab_shimmer_loading.dart';
import '/features/tabs/home_tab/presentation/widgets/states/home_tab_success.dart';
import '../controller/search_bar_cubit/search_bar_cubit.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<HomeTabCubit>()..emitHomeTabStates(context),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBarCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) => RefreshIndicator(
          color: AppColors.primary,
          backgroundColor: Colors.white,
          strokeWidth: 2.5,
          onRefresh: () async {
            return context.read<HomeTabCubit>().emitHomeTabStates(context);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                // Enhanced Search Bar with Location
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24.r),
                      bottomRight: Radius.circular(24.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      HomeSearchBarWidget(),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                // Main Services Section
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: BlocBuilder<HomeTabCubit, HomeTabState>(
                    builder: (context, state) {
                      print(
                          'Current State: $state'); // Debug print to track state
                      if (state is HomeTabSuccessState) {
                        List<CategoryModel>? allList = state.homeTapModel.data?.categories;
                        var deliverList = allList
                            ?.where((element) => element.type == 'delivery')
                            .toList();
                        var serviceList = allList
                            ?.where((element) => element.type == 'service')
                            .map((allList) =>
                                ServiceModel.fromJson(allList.toJson()))
                            .toList();

                        return HomeTabSuccess(
                            categoriesDeliveryList: deliverList!,
                            categoriesServiceList: serviceList!);
                      } else if (state is HomeTabErrorState) {
                        return ErrorMessageWidget(
                            errorMessage: state.failure.errorMessage);
                      } else if (state is HomeTabLoadingState) {
                        return HomeTabShimmerLoading();
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
