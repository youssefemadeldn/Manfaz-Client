import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../data/models/store_details_model.dart';

class WorkingHoursSection extends StatelessWidget {
  final List<WorkingHours> workingHours;

  const WorkingHoursSection({
    Key? key,
    required this.workingHours,
  }) : super(key: key);

  String _getDayName(int? dayOfWeek) {
    switch (dayOfWeek) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              Icon(Icons.access_time, color: AppColors.primary),
              SizedBox(width: 8.w),
              Text(
                'Working Hours',
                style: AppStyles.header3,
              ),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Working Hours List
          ...workingHours.map((workingHour) => _buildWorkingHourItem(workingHour)).toList(),
        ],
      ),
    );
  }

  Widget _buildWorkingHourItem(WorkingHours workingHour) {
    final bool isToday = _isToday(workingHour.dayOfWeek ?? 0);
    
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: isToday ? AppColors.primaryLight.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        border: isToday 
          ? Border.all(color: AppColors.primary.withOpacity(0.3)) 
          : null,
      ),
      child: Row(
        children: [
          // Day
          Expanded(
            flex: 2,
            child: Text(
              _getDayName(workingHour.dayOfWeek),
              style: AppStyles.bodyText2.copyWith(
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                color: isToday ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
          ),
          
          // Hours
          Expanded(
            flex: 3,
            child: Text(
              _formatHours(workingHour.openTime, workingHour.closeTime),
              style: AppStyles.bodyText2,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  bool _isToday(int dayOfWeek) {
    final now = DateTime.now();
    final weekday = now.weekday;
    
    return dayOfWeek == weekday;
  }

  String _formatHours(String? openTime, String? closeTime) {
    if (openTime == null || closeTime == null) {
      return 'Closed';
    }
    
    if (openTime.isEmpty || closeTime.isEmpty) {
      return 'Closed';
    }
    
    return '$openTime - $closeTime';
  }
}
