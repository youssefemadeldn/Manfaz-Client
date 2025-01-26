import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tr('home.all_services_at_your_finger_tips'),
            style: AppStyles.header3.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            tr('home.see_all'),
            style: AppStyles.bodyText2.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
