import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/services_list_view_view/presentation/widgets/choose_your_service_card_item.dart';

import '../../../tabs/home_tab/data/models/services_based_on_category_model.dart';

class ChooseYourService extends StatelessWidget {
  final List<ServiceModel> servicesList;
  const ChooseYourService({
    super.key, required this.servicesList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 8)],
      ),
      child: Column(
        children: [
          Text(
            tr('ServicesListViewView.title'),
            style: AppStyles.header3,
          ),
          SizedBox(height: 10),

          // Services Selection Row
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: servicesList.length,
              itemBuilder: (context, index) {
                return ChooseYourServiceCardItem(
                  serviceModel: servicesList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
