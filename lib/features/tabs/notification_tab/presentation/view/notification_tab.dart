import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          Text(
            'Notification',
            style: AppStyles.font24BlackBold,
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Card(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10.r,
                            backgroundColor: AppColors.green,
                            child: Icon(
                              Icons.done,
                              color: AppColors.white,
                              size: 15.r,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'house cleaning request is complete',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true,
                            textWidthBasis: TextWidthBasis.longestLine,
                            style: AppStyles.font20BlackBold,
                          ),
                        ],
                      ),
                      // December 25, 2024 – 3:00 PM

                      Text(
                        'Request details: Air conditioner maintenance in Jeddah',
                        style: AppStyles.font14LightGreyRegular,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('3 hours ago',
                              style: AppStyles.font14LightGreyRegular),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
