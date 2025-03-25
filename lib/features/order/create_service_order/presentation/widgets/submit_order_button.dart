import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/helper/dialog_helper.dart';
import '../controller/create_service_order_cubit/create_service_order_cubit.dart';

class SubmitOrderButton extends StatelessWidget {
  final VoidCallback onSubmit;
  final Map<String, dynamic> arguments;

  const SubmitOrderButton({
    super.key,
    required this.onSubmit,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
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
      child: BlocConsumer<CreateServiceOrderCubit, CreateServiceOrderState>(
        listener: (context, state) {
          if (state is CreateServiceOrderSuccess) {
            DialogHelper.showCustomDialog(
              context: context,
              title: Text(
                tr('create_service_order.submit.success'),
                style: AppStyles.header2,
              ),
              content: Text(
                tr('create_service_order.submit.success_message'),
                style: AppStyles.bodyText1,
              ),
              onConfirm: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            );
          } else if (state is CreateServiceOrderFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.failure.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            onPressed: state is CreateServiceOrderLoading ? null : onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: state is CreateServiceOrderLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                    tr('create_service_order.submit.place_order'),
                    style: AppStyles.bodyText1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
