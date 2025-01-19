import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class NotificationCardItem extends StatelessWidget {
  const NotificationCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightGrey,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder for profile/icon
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2016/11/18/19/07/happy-1836445_640.jpg',
              ),
              radius: 50.r,
              backgroundColor: AppColors.green,
            ),
            SizedBox(width: 16),
            // Main content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Application Sent',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      text: 'Applications for ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      children: [
                        TextSpan(
                          text: 'Telegram',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: ' companies have entered for company review',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '25 minutes ago',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Delete button
            GestureDetector(
              onTap: () {
                // Add your delete logic here
              },
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
