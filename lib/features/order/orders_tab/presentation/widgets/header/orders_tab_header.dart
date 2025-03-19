import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/app_styles.dart';

class OrdersTabHeader extends StatelessWidget {
  const OrdersTabHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('orders_tab.my_orders'),
          style: AppStyles.header2,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
