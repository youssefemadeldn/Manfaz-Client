import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/helper/easy_localization_helper.dart';
import 'package:manfaz/core/helper/bottom_sheet_helper.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import '../../../tabs/profile_tab/presentation/widgets/menu_item.dart';
import '../widgets/edit_profile_bottom_sheet.dart';
import '../../../tabs/profile_tab/data/models/get_user_profile_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'settings.title'.tr(),
          style: AppStyles.header3.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.textPrimary,
            size: 20.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _buildSettingsContent(context),
    );
  }

  Widget _buildSettingsContent(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        _buildSettingsCard(context),
        SizedBox(height: 20.h),
        _buildDeleteAccountButton(context),
      ],
    );
  }

  Widget _buildSettingsCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          MenuItem(
            icon: Icons.edit_note,
            title: "settings.edit_profile".tr(),
            showTrailingArrow: true,
            onTap: () {
              // Navigate to edit profile screen
              // Sample user data - in a real app, this would come from a state management solution
              final userData = Data(
                id: "1",
                name: "Youssef",
                email: "youssef@example.com",
                phone: "+201234567890",
                imageUrl: "https://ui-avatars.com/api/?name=Youssef&background=0D8ABC&color=fff",
              );
              BottomSheetHelper.show(
                context: context, 
                isScrollControlled: true,
                child: EditProfileBottomSheet(userData: userData),
              );
            },
          ),
          Divider(height: 1, color: AppColors.divider),
          MenuItem(
            icon: Icons.language,
            title: "settings.language".tr(),
            showTrailingArrow: true,
            onTap: () {
              _showLanguageBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteAccountButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: MenuItem(
        icon: Icons.delete_forever,
        title: "settings.delete_account".tr(),
        showTrailingArrow: true,
        onTap: () {
          _showDeleteAccountConfirmation(context);
        },
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'settings.language'.tr(),
              style: AppStyles.header3.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 20.h),
            _buildLanguageOption(
              context,
              title: 'settings.english'.tr(),
              locale: const Locale('en'),
              currentLocale: context.locale,
            ),
            Divider(height: 1, color: AppColors.divider),
            _buildLanguageOption(
              context,
              title: 'settings.arabic'.tr(),
              locale: const Locale('ar'),
              currentLocale: context.locale,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context, {
    required String title,
    required Locale locale,
    required Locale currentLocale,
  }) {
    final isSelected = locale.languageCode == currentLocale.languageCode;
    final easyLocalizationHelper = EasyLocalizationHelper();
    
    return InkWell(
      onTap: () {
        if (!isSelected) {
          // Use our helper method instead of directly setting locale
          easyLocalizationHelper.changeLocale(context, locale);
          Navigator.pop(context);
          
          // // Show a loading indicator while the app refreshes
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text('settings.language_changing'.tr()),
          //     duration: const Duration(seconds: 2),
          //   ),
          // );
          
          // // Delay navigation to allow the language change to take effect
          // Future.delayed(const Duration(milliseconds: 300), () {
          //   // Navigate to the home page to refresh the app
          //   Navigator.of(context).popUntil((route) => route.isFirst);
          // });
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Row(
          children: [
            Text(
              title,
              style: AppStyles.bodyText2.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.primary,
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }

  void _showDeleteAccountConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Text(
          'settings.delete_account'.tr(),
          style: AppStyles.header3.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          'settings.delete_confirmation'.tr(),
          style: AppStyles.bodyText2.copyWith(
            color: AppColors.grey,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'dialog.cancel'.tr(),
              style: AppStyles.bodyText2.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Implement delete account functionality
              Navigator.pop(context);
            },
            child: Text(
              'settings.delete_account'.tr(),
              style: AppStyles.bodyText2.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}