import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';

import '../../../data/models/home_tab_model.dart';
import '../../../data/models/services_based_on_category_model.dart';

class ServiceCardItem extends StatelessWidget {
  final ServiceModel serviceModel;
  final void Function() onTap;

  const ServiceCardItem({
    super.key,
    required this.serviceModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 65.h,
            child: Container(
              padding: EdgeInsets.all(10.r),
              alignment: Alignment.center,
              width: 70.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: AppColors.background,
                  width: 1.w,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: serviceModel.iconUrl ?? '',
                placeholder: (context, url) => CircularProgressIndicator(
                  color: AppColors.primary,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // Image.asset(
              //   image,
              //   height: double.infinity,
              //   color: AppColors.primary,
              // ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            serviceModel.name ?? 'null',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1, // Ensure text fits in one line
            style: AppStyles.bodyText2.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
