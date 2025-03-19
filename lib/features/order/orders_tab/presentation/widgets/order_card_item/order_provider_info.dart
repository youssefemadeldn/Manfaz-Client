import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../controller/order_tab_cubit/order_tab_cubit.dart';

class OrderProviderInfo extends StatelessWidget {
  final bool isDeliveryOrder;
  final String providerName;
  final String createdAt;

  const OrderProviderInfo({
    super.key,
    required this.isDeliveryOrder,
    required this.providerName,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            isDeliveryOrder
                ? (providerName.isNotEmpty
                    ? '${tr('orders_tab.driver')}: $providerName'
                    : '')
                : (providerName.isNotEmpty
                    ? '${tr('orders_tab.provider')}: $providerName'
                    : ''),
            style: AppStyles.bodyText2.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          context.read<OrderTabCubit>().formatDate(createdAt),
          style: AppStyles.bodyText2.copyWith(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
