import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/cus_text_form_field.dart';
import '../../../tabs/profile_tab/data/models/get_user_profile_model.dart';
import '../controller/edit_profile_bottom_sheet_cubit/edit_profile_bottom_sheet_cubit.dart';

class EditProfileBottomSheet extends StatelessWidget {
  final Data userData;

  const EditProfileBottomSheet({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = EditProfileBottomSheetCubit();
        cubit.initialize(userData);
        return cubit;
      },
      child: BlocBuilder<EditProfileBottomSheetCubit, EditProfileBottomSheetState>(
        builder: (context, state) {
          final cubit = context.read<EditProfileBottomSheetCubit>();
          
          if (state is EditProfileBottomSheetInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (state is! EditProfileBottomSheetForm) {
            return const SizedBox.shrink();
          }
          
          return Container(
            padding: EdgeInsets.only(
              top: 20.h,
              left: 20.w,
              right: 20.w,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            child: Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildHeader(context),
                    SizedBox(height: 24.h),
                    _buildProfileImage(context, state),
                    SizedBox(height: 24.h),
                    _buildNameField(context, cubit),
                    SizedBox(height: 16.h),
                    _buildEmailField(context),
                    SizedBox(height: 16.h),
                    _buildPhoneField(context),
                    SizedBox(height: 16.h),
                    _buildPasswordField(context, state, cubit),
                    SizedBox(height: 32.h),
                    _buildButtons(context, cubit),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Text(
          'settings.edit_profile_sheet.title'.tr(),
          style: AppStyles.header3.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: Icon(
            Icons.close,
            color: AppColors.textPrimary,
            size: 24.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context, EditProfileBottomSheetForm state) {
    final cubit = context.read<EditProfileBottomSheetCubit>();
    
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.2),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.r),
                  child: state.imageUrl != null && state.imageUrl!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: state.imageUrl!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.person,
                            size: 50.sp,
                            color: AppColors.primary,
                          ),
                        )
                      : Icon(
                          Icons.person,
                          size: 50.sp,
                          color: AppColors.primary,
                        ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () => cubit.handleImageChange(context),
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          TextButton(
            onPressed: () => cubit.handleImageChange(context),
            child: Text(
              'settings.edit_profile_sheet.change_photo'.tr(),
              style: AppStyles.bodyText2.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameField(BuildContext context, EditProfileBottomSheetCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'settings.edit_profile_sheet.name'.tr(),
          style: AppStyles.bodyText2.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        CusTextFormField(
          controller: cubit.nameController,
          hintText: 'settings.edit_profile_sheet.name'.tr(),
          validator: cubit.validateName,
          onChanged: cubit.updateName,
          
        ),
      ],
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'settings.edit_profile_sheet.email'.tr(),
          style: AppStyles.bodyText2.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          decoration: BoxDecoration(
            color: AppColors.lightGrey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.grey.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  userData.email ?? 'N/A',
                  style: AppStyles.bodyText2.copyWith(color: AppColors.grey),
                ),
              ),
              Icon(
                Icons.lock_outline,
                size: 18.sp,
                color: AppColors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'settings.edit_profile_sheet.phone'.tr(),
          style: AppStyles.bodyText2.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          decoration: BoxDecoration(
            color: AppColors.lightGrey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.grey.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  userData.phone ?? 'N/A',
                  style: AppStyles.bodyText2.copyWith(color: AppColors.grey),
                ),
              ),
              Icon(
                Icons.lock_outline,
                size: 18.sp,
                color: AppColors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(
    BuildContext context, 
    EditProfileBottomSheetForm state,
    EditProfileBottomSheetCubit cubit,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'settings.edit_profile_sheet.new_password'.tr(),
          style: AppStyles.bodyText2.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        CusTextFormField(
          controller: cubit.passwordController,
          hintText: 'settings.edit_profile_sheet.new_password'.tr(),
          isObscureText: !state.isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              state.isPasswordVisible ? Icons.visibility_off : Icons.visibility,
              color: AppColors.grey,
              size: 20.sp,
            ),
            onPressed: cubit.togglePasswordVisibility,
          ),
          validator: cubit.validatePassword,
          onChanged: cubit.updatePassword,
        ),
      ],
    );
  }

  Widget _buildButtons(BuildContext context, EditProfileBottomSheetCubit cubit) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primary,
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
                side: BorderSide(color: AppColors.primary),
              ),
            ),
            child: Text(
              'settings.edit_profile_sheet.cancel'.tr(),
              style: AppStyles.bodyText2.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: ElevatedButton(
            onPressed: () => cubit.saveChanges(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              'settings.edit_profile_sheet.save'.tr(),
              style: AppStyles.bodyText2.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
