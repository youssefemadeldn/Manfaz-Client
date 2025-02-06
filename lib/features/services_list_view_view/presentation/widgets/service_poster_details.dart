import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/cus_text_button.dart';

class ServicePosterDetails extends StatelessWidget {
  const ServicePosterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              Text(
                tr("ServicesListViewView.external_painting"),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.star, color: Colors.amber),
              Text(tr("ServicesListViewView.rating"),
                  style: TextStyle(fontSize: 16)),
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
                child: Image.asset("assets/images/ibox_decor.jpg",
                    height: 120, width: double.infinity, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr("ServicesListViewView.gold_warranty"),
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      tr("ServicesListViewView.paint_wall"),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      tr("ServicesListViewView.paint_service_description"),
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Text(
                      tr("ServicesListViewView.price_includes_tax"),
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Text(
                          tr("ServicesListViewView.price"),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          tr("ServicesListViewView.installments"),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: CusTextButton(
                            backgroundColor: AppColors.buttonPrimary,
                            borderRadius: 8,
                            buttonText: tr("ServicesListViewView.order_now"),
                            // textStyle: TextStyle(color: Colors.white),
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
