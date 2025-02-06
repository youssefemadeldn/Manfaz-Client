import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manfaz/core/theme/app_colors.dart';

class ChooseYourServiceCardItem extends StatelessWidget {
  const ChooseYourServiceCardItem({
    super.key,
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
                child: Image.asset('assets/images/ibox_decor.jpg', height: 40)),
          ),
          SizedBox(height: 5),
          Text(tr('home_service_details_view.title'),
              textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
