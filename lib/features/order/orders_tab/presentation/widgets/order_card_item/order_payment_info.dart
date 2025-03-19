import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/theme/app_styles.dart';

class OrderPaymentInfo extends StatelessWidget {
  final String paymentMethod;
  final double totalAmount;

  const OrderPaymentInfo({
    super.key,
    required this.paymentMethod,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildDetailRow('orders_tab.payment_method', paymentMethod),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildDetailRow('orders_tab.total_amount', '$totalAmount ${tr('orders_tab.currency')}'),
        ),
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
