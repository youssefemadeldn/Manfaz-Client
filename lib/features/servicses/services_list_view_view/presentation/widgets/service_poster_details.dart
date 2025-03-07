import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/cus_text_button.dart';
import '../../data/model/parameters_services_list_model.dart';

class ServicePosterDetails extends StatelessWidget {
  final ParametersServiceModel parametersServiceModel;
  const ServicePosterDetails({
    super.key,
    required this.parametersServiceModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  parametersServiceModel.name ?? 'null',
                  style: AppStyles.header2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (parametersServiceModel.availability??true) ...[
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    tr("ServicesListViewView.available"),
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 8)],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: parametersServiceModel.imageUrl!,
                  placeholder: (context, url) => SizedBox(
                    height: 200.h,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                // Image.network(
                //   serviceModel.imageUrl ?? 'null',
                //   height: 200,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                // ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      parametersServiceModel.name ?? 'null',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      parametersServiceModel.description ?? 'null',
                      style: AppStyles.bodyText1.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr("ServicesListViewView.price"),
                              style: AppStyles.bodyText1,
                            ),
                            Text(
                              "\$${parametersServiceModel.price?.toStringAsFixed(2)}",
                              style: AppStyles.priceTag
                                  .copyWith(color: AppColors.textPrimary),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr("ServicesListViewView.duration"),
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "${parametersServiceModel.duration?.toString()} ${tr("ServicesListViewView.hours")}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 20),
                                Text(
                                  " ${parametersServiceModel.rating}/5",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "(${parametersServiceModel.ratingCount} ${'reviews'})",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (parametersServiceModel.warranty != null && parametersServiceModel.warranty! > 0) ...[
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.verified_user_outlined, 
                                 color: AppColors.primary, size: 16),
                            SizedBox(width: 4),
                            Text(
                              "${parametersServiceModel.warranty} ${tr("ServicesListViewView.months_warranty")}",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    if (parametersServiceModel.installmentAvailable == !true) ...[
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/images/service_poster_details/payment.svg',
                              color: Colors.blue,
                              width: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "${'installment available'} - ${parametersServiceModel.monthlyInstallment?.toStringAsFixed(2)}/mo",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            backgroundColor: AppColors.buttonPrimary,
                            borderRadius: 8,
                            child: Text(
                              tr("ServicesListViewView.find_talents"),
                              style: AppStyles.buttonText,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.workerListViewView);
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomButton(
                            backgroundColor: Colors.white,
                            borderRadius: 8,
                            borderSideColor: AppColors.buttonPrimary,
                            child: Text(
                              tr("ServicesListViewView.view_details"),
                              style: AppStyles.buttonText.copyWith(
                                color: AppColors.buttonPrimary,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
