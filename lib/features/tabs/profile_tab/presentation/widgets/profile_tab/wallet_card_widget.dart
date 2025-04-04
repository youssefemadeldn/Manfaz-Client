import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../../../profile_tab/data/models/get_user_profile_model.dart';

class WalletCardWidget extends StatelessWidget {
  final Data userProfile;
  final Function(String) formatDateCallback;

  const WalletCardWidget({
    Key? key,
    required this.userProfile,
    required this.formatDateCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wallet = userProfile.wallet?.isNotEmpty == true ? userProfile.wallet!.first : null;
    final balance = wallet?.balance ?? 0.0;
    final transactions = wallet?.transactions ?? [];

    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2C3E50),
            Color(0xFF4CA1AF),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Wallet Header
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                  size: 24.sp,
                ),
                SizedBox(width: 10.w),
                Text(
                  "profile_tab.wallet".tr(),
                  style: AppStyles.header3.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "profile_tab.add_funds".tr(),
                        style: AppStyles.bodyText2.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Balance
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "profile_tab.current_balance".tr(),
                      style: AppStyles.bodyText2.copyWith(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "${balance.toStringAsFixed(2)} SAR",
                      style: AppStyles.header3.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Recent Transactions
          if (transactions.isNotEmpty)
            Container(
              margin: EdgeInsets.all(20.w),
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "profile_tab.recent_transactions".tr(),
                    style: AppStyles.bodyText1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  ...transactions.take(2).map((transaction) {
                    final isDeposit = transaction.type == "deposit";
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: isDeposit
                                  ? Colors.green.withOpacity(0.2)
                                  : Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              isDeposit
                                  ? Icons.arrow_downward
                                  : Icons.arrow_upward,
                              color: isDeposit ? Colors.green : Colors.red,
                              size: 16.sp,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isDeposit
                                      ? "profile_tab.deposit".tr()
                                      : "profile_tab.withdrawal".tr(),
                                  style: AppStyles.bodyText2.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                if (transaction.createdAt != null)
                                  Text(
                                    formatDateCallback(transaction.createdAt!),
                                    style: AppStyles.caption.copyWith(
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Text(
                            "${isDeposit ? '+' : '-'} ${transaction.amount?.toStringAsFixed(2) ?? '0.00'} SAR",
                            style: AppStyles.bodyText2.copyWith(
                              color: isDeposit ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
