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
            'Services Categories',
            style: AppStyles.header3.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            'See All',
            style: AppStyles.bodyText2.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
