import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/cus_text_button.dart';
import '../../../tabs/home_tab/data/models/services_based_on_category_model.dart';

class ServicePosterDetails extends StatelessWidget {
  final ServiceModel serviceModel;
  const ServicePosterDetails({
    super.key,
    required this.serviceModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              Text(
                serviceModel.name??'null',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              if (serviceModel.availability!) ...[
                const Spacer(),
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

                child: Image.network(
                  serviceModel.imageUrl??'null',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    "assets/images/placeholder.jpg",
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceModel.name??'null',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      serviceModel.description??'null',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr("ServicesListViewView.price"),
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "\$${serviceModel.price?.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       tr("ServicesListViewView.duration"),
                        //       style: TextStyle(color: Colors.grey),
                        //     ),
                        //     Text(
                        //       "${categoryModel.duration?.toString()} ${tr("ServicesListViewView.hours")}",
                        //       style: TextStyle(
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: CusTextButton(
                            backgroundColor: AppColors.buttonPrimary,
                            borderRadius: 8,
                            buttonText: tr("ServicesListViewView.order_now"),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CusTextButton(
                            backgroundColor: Colors.white,
                            borderRadius: 8,
                            borderSideColor: AppColors.buttonPrimary,
                            buttonText: tr("ServicesListViewView.view_details"),
                            textStyle: AppStyles.buttonText.copyWith(
                              color: AppColors.buttonPrimary,
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
