import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../../data/models/home_tab_model.dart';

class DeliveryCardItem extends StatelessWidget {

  final CategoryModel categoryModel;
  final VoidCallback onTap;
  const DeliveryCardItem({
    super.key,
    required this.categoryModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // width: 190.w,
        // height: 200.h,
        // margin: EdgeInsets.all(8.r),
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: categoryModel.imageUrl!,
              width: 140.w,
              height: 100.h,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // ,
            // Image.network(
            //   categoryModel.imageUrl??'',
            //   width: 140.w,
            //   height: 100.h,
            // ),
            Text(
              categoryModel.name ?? 'null',
              style: AppStyles.header3.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              categoryModel.subName ?? 'null',
              style: AppStyles.bodyText1.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            // Container(
            //   padding: EdgeInsets.all(3.r),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20.r),
            //     color: AppColors.primary.withValues(alpha: .9),
            //   ),
            //   // alignment: Alignment.center,
            //   child: Text(
            //     textAlign: TextAlign.center,
            //     price,
            //     style: AppStyles.bodyText3.copyWith(
            //       color: AppColors.white,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
