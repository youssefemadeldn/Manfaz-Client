import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/helper/snack_bar_helper.dart';
import '../../../../tabs/profile_tab/data/models/get_user_profile_model.dart';

part 'edit_profile_bottom_sheet_state.dart';

@injectable
class EditProfileBottomSheetCubit extends Cubit<EditProfileBottomSheetState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  EditProfileBottomSheetCubit() : super(EditProfileBottomSheetInitial());

  void initialize(Data userData) {
    nameController.text = userData.name ?? '';
    emit(EditProfileBottomSheetForm(
      name: userData.name ?? '',
      imageUrl: userData.imageUrl,
    ));
  }

  void updateName(String name) {
    if (state is EditProfileBottomSheetForm) {
      final currentState = state as EditProfileBottomSheetForm;
      emit(currentState.copyWith(name: name));
    }
  }

  void updatePassword(String password) {
    if (state is EditProfileBottomSheetForm) {
      final currentState = state as EditProfileBottomSheetForm;
      emit(currentState.copyWith(password: password));
    }
  }

  void togglePasswordVisibility() {
    if (state is EditProfileBottomSheetForm) {
      final currentState = state as EditProfileBottomSheetForm;
      emit(currentState.copyWith(isPasswordVisible: !currentState.isPasswordVisible));
    }
  }

  void handleImageChange(BuildContext context) {
    // This would be implemented with image picker functionality
    SnackBarHelper.showInfoSnackBar(
      context,
      message: 'Image upload functionality would be implemented here',
    );
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void saveChanges(BuildContext context) {
    if (validateForm()) {
      // This would save the changes to the user profile
      // For now, just show a success message and close the sheet
      SnackBarHelper.showSuccessSnackBar(
        context,
        message: 'Profile updated successfully',
      );
      Navigator.pop(context);
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'settings.edit_profile_sheet.name_required'.tr();
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value != null && value.isNotEmpty && value.length < 6) {
      return 'settings.edit_profile_sheet.password_length'.tr();
    }
    return null;
  }

  @override
  Future<void> close() {
    nameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
