import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/features/order/orders_tab/data/models/orders_list_model.dart';
import 'package:intl/intl.dart';

class OrderCardItem extends StatelessWidget {
  final Order order;
  const OrderCardItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDeliveryOrder = order.deliveryDriverId != null;

    return Card(
      color: AppColors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for Order ID and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${tr('orders_tab.orderID')} #${order.id}',
                    style: AppStyles.appBarTitle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(order.status ?? ''),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    order.status ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            
            // Provider/Driver Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    isDeliveryOrder 
                        ? '${tr('orders_tab.driver')}: ${order.deliveryDriver?.name ?? ''}'
                        : '${tr('orders_tab.provider')}: ${order.provider?.name ?? ''}',
                    style: AppStyles.bodyText2.copyWith(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _formatDate(order.createdAt ?? ''),
                  style: AppStyles.bodyText2.copyWith(
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Service/Delivery Details
            if (isDeliveryOrder) ...[
              _buildDetailRow('orders_tab.address', order.address ?? ''),
              _buildDetailRow('orders_tab.notes', order.notes ?? ''),
            ] else if (order.service != null) ...[
              _buildDetailRow('orders_tab.service', order.service?.name ?? ''),
              if (order.duration != null)
                _buildDetailRow('orders_tab.duration', '${order.duration} ${tr('orders_tab.minutes')}'),
            ],
            
            // Payment Details
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildDetailRow('orders_tab.payment_method', order.paymentMethod ?? ''),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildDetailRow('orders_tab.total_amount', '${order.totalAmount ?? 0} ${tr('orders_tab.currency')}'),
                ),
              ],
            ),
          ],
        ),
      ),
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

  String _formatDate(String date) {
    try {
      final DateTime parsedDate = DateTime.parse(date);
      return DateFormat('dd MMM yyyy').format(parsedDate);
    } catch (e) {
      return date;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'in progress':
        return AppColors.primary;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return AppColors.primaryLight;
    }
  }
}
