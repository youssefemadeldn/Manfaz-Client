import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/features/order/orders_tab/data/models/orders_list_model.dart';
import 'order_card_item/order_header.dart';
import 'order_card_item/order_provider_info.dart';
import 'order_card_item/order_service_details.dart';
import 'order_card_item/order_payment_info.dart';

class OrderCardItem extends StatelessWidget {
  final Order order;

  const OrderCardItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDeliveryOrder = order.deliveryDriver != null;

    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderHeader(
            orderId: order.id.toString(),
            status: order.status ?? '',
          ),
          SizedBox(height: 10.h),
          OrderProviderInfo(
            isDeliveryOrder: isDeliveryOrder,
            providerName: isDeliveryOrder 
                ? order.deliveryDriver?.name ?? ''
                : order.provider?.name ?? '',
            createdAt: order.createdAt ?? '',
          ),
          SizedBox(height: 10.h),
          OrderServiceDetails(
            serviceName: order.service?.name ?? '',
            duration: order.duration ?? 0,
          ),
          SizedBox(height: 10.h),
          OrderPaymentInfo(
            paymentMethod: order.paymentMethod ?? '',
            totalAmount: (order.totalAmount ?? 0).toDouble(),
          ),
        ],
      ),
    );
  }
}
