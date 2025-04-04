import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/helper/bottom_sheet_helper.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/utils/order_date_formatter.dart';
import '../../../../../core/widgets/cus_text_button.dart';
import '../../../../../core/widgets/error_message_widget.dart';
import '../controller/profile_tab_cubit/profile_tab_cubit.dart';
import '../widgets/profile_tab/profile_header_widget.dart';
import '../widgets/profile_tab/stats_section_widget.dart';
import '../widgets/profile_tab/wallet_card_widget.dart';
import '../widgets/profile_tab/menu_items_widget.dart';
import '../widgets/profile_tab/support_section_widget.dart';
import '../widgets/saved_addresses_bottom_sheet.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => getIt<ProfileTabCubit>()..getUserProfileById(),
        child: BlocBuilder<ProfileTabCubit, ProfileTabState>(
          builder: (context, state) {
            if (state is ProfileTabLoading) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(child: CircularProgressIndicator(
                  color: AppColors.primary,
                )),
              );
            } else if (state is ProfileTabError) {
              return ErrorMessageWidget(errorMessage: state.failure.errorMessage);
            } else if(state is ProfileTabSuccess) {
              final userProfile = state.getUserProfile.data;
              
              if (userProfile == null) {
                return ErrorMessageWidget(errorMessage: 'profile_tab.no_data'.tr());
              }
              
              return Column(
                children: [
                  // Profile Header
                  ProfileHeaderWidget(userProfile: userProfile),
                    
                  // Stats Section
                  StatsSectionWidget(userProfile: userProfile),
                    
                  // Wallet Card
                  WalletCardWidget(
                    userProfile: userProfile,
                    formatDateCallback: DateFormatter.formatDate,
                  ),
                    
                  // Menu Items
                  MenuItemsWidget(
                    userProfile: userProfile,
                    onAddressesPressed: () {
                      BottomSheetHelper.show(
                        context: context,
                        child: SavedAddressesBottomSheet(
                          locations: userProfile.locations,
                        ),
                      );
                    },
                  ),
                    
                  SizedBox(height: 20.h),
                    
                  // Add Coupon Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomButton(
                      onPressed: () {
                        // Handle add coupon action
                        // This could be moved to the cubit in the future
                      },
                      backgroundColor: AppColors.primary,
                      borderRadius: 8,
                      horizontalPadding: 16,
                      verticalPadding: 12,
                      buttonWidth: double.infinity,
                      child: Text(
                        "profile_tab.add_coupon".tr(),
                        style: AppStyles.buttonText,
                      ),
                    ),
                  ),
                    
                  SizedBox(height: 20.h),
                    
                  // Support Section
                  SupportSectionWidget(
                    onSettingsPressed: () {
                      Navigator.pushNamed(context, Routes.settingsView);
                    },
                    onLogoutPressed: () async {
                      context.read<ProfileTabCubit>().logout(context);
                    },
                  ),
                    
                  SizedBox(height: 20.h),
                ],
              );
            }
            
            // Default state (initial)
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Text('profile_tab.loading'.tr()),
              ),
            );
          },
        ),
      ),
    );
  }
}
