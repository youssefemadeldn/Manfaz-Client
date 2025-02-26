import 'package:flutter/material.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../tabs/home_tab/data/models/services_based_on_category_model.dart';

class ChooseYourServiceCardItem extends StatelessWidget {
  final ServiceModel serviceModel;
  const ChooseYourServiceCardItem({
    super.key,
    required this.serviceModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                child: Image.network(serviceModel.iconUrl??'null', height: 40)),
          ),
          SizedBox(height: 5),
          Text(serviceModel.name??'null',
              textAlign: TextAlign.center, style: AppStyles.bodyText1.copyWith(fontSize: 14) ),
        ],
      ),
    );
  }
}
