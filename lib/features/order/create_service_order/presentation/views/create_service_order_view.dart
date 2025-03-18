import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/widgets/cus_text_button.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/helper/dialog_helper.dart';
import '../../../../../core/helper/snack_bar_helper.dart';
import '../controller/create_service_order_cubit/create_service_order_cubit.dart';
import '../widgets/service_order_header.dart';
import '../widgets/location_selector.dart';
import '../widgets/notes_input.dart';
import '../widgets/price_info_widget.dart';
import '../widgets/payment_method_selector.dart';
import '../widgets/submit_order_button.dart';

class CreateServiceOrderView extends StatelessWidget {
  final Map<String, dynamic> arguments;
  const CreateServiceOrderView({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    final price = arguments['price'] as double;
    final duration = arguments['duration'] as int;
    final totalAmount = arguments['totalAmount'] as double;
    final cubit = context.read<CreateServiceOrderCubit>();

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: Offset(0, -20.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 16.w, right: 16.w, top: 80.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ServiceOrderHeader(),
                          SizedBox(height: 24.h),
                          BlocBuilder<CreateServiceOrderCubit,
                              CreateServiceOrderState>(
                            buildWhen: (previous, current) =>
                                current is LocationSelected,
                            builder: (context, state) {
                              return LocationSelector(
                                selectedLocation: cubit.selectedLocation,
                                onLocationSelected: cubit.selectLocation,
                              );
                            },
                          ),
                          SizedBox(height: 24.h),
                          NotesInput(
                            controller: cubit.notesController,
                          ),
                          SizedBox(height: 32.h),
                          PriceInfoWidget(
                            price: price,
                            duration: duration,
                            totalAmount: totalAmount,
                          ),
                          SizedBox(height: 32.h),
                          BlocBuilder<CreateServiceOrderCubit,
                              CreateServiceOrderState>(
                            buildWhen: (previous, current) =>
                                current is PaymentMethodSelected,
                            builder: (context, state) {
                              return PaymentMethodSelector(
                                selectedPaymentMethod:
                                    cubit.selectedPaymentMethod,
                                paymentMethods: cubit.paymentMethods,
                                onPaymentMethodSelected:
                                    cubit.selectPaymentMethod,
                              );
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).padding.bottom + 80.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:
                BlocConsumer<CreateServiceOrderCubit, CreateServiceOrderState>(
              listener: (context, state) {
                if (state is CreateServiceOrderSuccess) {
                  DialogHelper.showCustomDialog(
                    context: context,
                    title: Text(
                      'Order Added',
                      style: AppStyles.header2,
                    ),
                    content: Text(
                      "Your service order has been created successfully",
                      style: AppStyles.bodyText1,
                    ),
                    onConfirm: () {
                      Navigator.pushNamed(
                          context, Routes.cusBottomNavigationBar);
                    },
                  );
                  log(state.createServiceOrderModel.message!);
                } else if (state is CreateServiceOrderFailure) {
                  DialogHelper.showCustomDialog(
                    context: context,
                    title: const Text('Error'),
                    content: Text(state.failure.errorMessage),
                  );
                  log(state.failure.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is CreateServiceOrderLoading) {
                  return Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: CustomButton(
                        onPressed: () {},
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        )),
                  );
                }
                return SubmitOrderButton(
                  onSubmit: () {
                    if (cubit.notesController.text.trim().isEmpty) {
                      SnackBarHelper.showErrorSnackBar(
                        context,
                        message: 'Please add notes before submitting the order',
                      );
                      return;
                    }
                    try {
                      cubit.handleSubmit(arguments);
                    } catch (e) {
                      SnackBarHelper.showErrorSnackBar(
                        context,
                        message: e.toString().split('Exception:').last.trim(),
                      );
                    }
                  },
                  arguments: arguments,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
