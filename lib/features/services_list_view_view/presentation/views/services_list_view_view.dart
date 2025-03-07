import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import '../../../../core/di/di.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/error_message_widget.dart';
import '../controller/cubit/service_list_view_cubit.dart';
import '../widgets/choose_your_service.dart';
import '../widgets/service_poster_details.dart';

class ServicesListViewView extends StatelessWidget {
  const ServicesListViewView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ServiceListViewCubit>()
        ..getServicesParametersList(
            categoryId: '67ac9ee57d681bdd84645a4d', type: 'service'),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.white,
          elevation: 0,
          title: Text(
            tr('ServicesListViewView.choose_your_service'),
            style: AppStyles.appBarTitle,
          ),
          leading: IconButton(
            icon: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            onPressed: () {},
          ),
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.search, color: Colors.black),
          //     onPressed: () {},
          //   )
          // ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ServiceListViewCubit, ServiceListViewState>(
            builder: (context, state) {
              if (state is ServiceListViewLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              } else if (state is ServiceListViewSuccess) {
                final servicesList = state.parametersServicesListModel.data;
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // Container(
                    //   padding: EdgeInsets.only(bottom: 12),
                    //   height: 200,
                    //   child: Center(
                    //     child: Image.asset(
                    //       'assets/images/resized_services.png',
                    //     ),
                    //   ),
                    // ),
                    ChooseYourService(
                      parametersServicesList: servicesList ?? [],
                    ),
                    SizedBox(height: 20),

                    Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: servicesList?.length ?? 0,
                          itemBuilder: (context, index) {
                            final parametersService = servicesList?[index];
                            return ServicePosterDetails(
                              parametersServiceModel: parametersService!,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                );
              } else if (state is ServiceListViewFailure) {
                return ErrorMessageWidget(
                  errorMessage: state.failure.errorMessage,
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
