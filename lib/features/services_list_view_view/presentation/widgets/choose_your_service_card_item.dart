import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../data/model/parameters_service_model.dart';

class ChooseYourServiceCardItem extends StatelessWidget {
  final ParametersServiceModel parametersServiceModel;
  final VoidCallback onTap;
  const ChooseYourServiceCardItem({
    super.key,
    required this.parametersServiceModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10),
                // boxShadow: [
                //   BoxShadow(color: Colors.grey.shade300, blurRadius: 4)
                // ],
              ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: parametersServiceModel.iconUrl ?? 'null',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: 85.w,
              child: Text(
                (parametersServiceModel.name ?? '')
                    .split(' ')
                    .take(3)
                    .join(' '),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppStyles.bodyText1.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
