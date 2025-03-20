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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.access_time, color: AppColors.primary),
              ),
              SizedBox(width: 12.w),
              Text(
                'Working Hours',
                style: AppStyles.header3,
              ),
              Spacer(),
              _buildOpenStatusBadge(),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Working Hours List
          ...workingHours.map((workingHour) => _buildWorkingHourItem(workingHour)).toList(),
        ],
      ),
    );
  }

  Widget _buildOpenStatusBadge() {
    final bool isOpen = _isCurrentlyOpen();
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isOpen ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: isOpen ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6.w),
          Text(
            isOpen ? 'Open Now' : 'Closed',
            style: AppStyles.caption.copyWith(
              color: isOpen ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkingHourItem(WorkingHours workingHour) {
    final bool isToday = _isToday(workingHour.dayOfWeek ?? 0);
    
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
      decoration: BoxDecoration(
        color: isToday ? AppColors.primaryLight.withOpacity(0.1) : Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
        border: isToday 
          ? Border.all(color: AppColors.primary.withOpacity(0.3)) 
          : Border.all(color: Colors.transparent),
      ),
      child: Row(
        children: [
          // Day Icon
          Container(
            width: 32.w,
            height: 32.w,
            margin: EdgeInsets.only(right: 12.w),
            decoration: BoxDecoration(
              color: isToday 
                ? AppColors.primary.withOpacity(0.1) 
                : Colors.grey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                _getDayName(workingHour.dayOfWeek).substring(0, 2),
                style: AppStyles.caption.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isToday ? AppColors.primary : AppColors.textSecondary,
                ),
              ),
            ),
          ),
          
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
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: isToday 
                  ? AppColors.primary.withOpacity(0.1) 
                  : Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                _formatHours(workingHour.openTime, workingHour.closeTime),
                style: AppStyles.bodyText3.copyWith(
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                  color: isToday ? AppColors.primary : AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
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
  
  bool _isCurrentlyOpen() {
    final now = DateTime.now();
    final weekday = now.weekday;
    
    // Find today's working hours
    final todayHours = workingHours.firstWhere(
      (wh) => wh.dayOfWeek == weekday,
      orElse: () => WorkingHours(),
    );
    
    if (todayHours.openTime == null || todayHours.closeTime == null) {
      return false;
    }
    
    // Parse hours
    try {
      final openTimeParts = todayHours.openTime!.split(':');
      final closeTimeParts = todayHours.closeTime!.split(':');
      
      if (openTimeParts.length < 2 || closeTimeParts.length < 2) {
        return false;
      }
      
      final openHour = int.parse(openTimeParts[0]);
      final openMinute = int.parse(openTimeParts[1]);
      final closeHour = int.parse(closeTimeParts[0]);
      final closeMinute = int.parse(closeTimeParts[1]);
      
      final openTime = TimeOfDay(hour: openHour, minute: openMinute);
      final closeTime = TimeOfDay(hour: closeHour, minute: closeMinute);
      final currentTime = TimeOfDay(hour: now.hour, minute: now.minute);
      
      // Convert to minutes for comparison
      final openMinutes = openTime.hour * 60 + openTime.minute;
      final closeMinutes = closeTime.hour * 60 + closeTime.minute;
      final currentMinutes = currentTime.hour * 60 + currentTime.minute;
      
      return currentMinutes >= openMinutes && currentMinutes <= closeMinutes;
    } catch (e) {
      return false;
    }
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
