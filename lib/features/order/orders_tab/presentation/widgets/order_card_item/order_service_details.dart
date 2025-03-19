import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/theme/app_styles.dart';

class OrderServiceDetails extends StatelessWidget {
  final String serviceName;
  final int duration;

  const OrderServiceDetails({
    super.key,
    required this.serviceName,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDetailRow('orders_tab.service', serviceName),
        SizedBox(height: 5.h),
        _buildDetailRow('orders_tab.duration', '$duration ${tr('orders_tab.minutes')}'),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      children: [
        Text('${tr(label)}: '),
        Expanded(
          child: Text(
            value,
            style: AppStyles.bodyText2.copyWith(
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
