import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
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
        return tr('store_details.working_hours.days.monday');
      case 2:
        return tr('store_details.working_hours.days.tuesday');
      case 3:
        return tr('store_details.working_hours.days.wednesday');
      case 4:
        return tr('store_details.working_hours.days.thursday');
      case 5:
        return tr('store_details.working_hours.days.friday');
      case 6:
        return tr('store_details.working_hours.days.saturday');
      case 7:
        return tr('store_details.working_hours.days.sunday');
      default:
        return tr('store_details.working_hours.days.unknown');
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
                tr('store_details.working_hours.title'),
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
            isOpen ? tr('store_details.working_hours.open_now') : tr('store_details.working_hours.closed'),
            style: AppStyles.bodyText2.copyWith(
              color: isOpen ? Colors.green : Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkingHourItem(WorkingHours workingHour) {
    final bool isToday = _isToday(workingHour.dayOfWeek ?? 0);
    
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: isToday ? AppColors.primaryLight.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          // Day Name
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  _getDayName(workingHour.dayOfWeek),
                  style: AppStyles.bodyText2.copyWith(
                    fontWeight: isToday ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                if (isToday) ...[
                  SizedBox(width: 6.w),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      tr('store_details.working_hours.today'),
                      style: AppStyles.caption.copyWith(
                        color: AppColors.primary,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          // Hours
          Expanded(
            flex: 3,
            child: Text(
              _formatHours(workingHour.openTime, workingHour.closeTime),
              style: AppStyles.bodyText2.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  bool _isToday(int dayOfWeek) {
    // Get current day (1-7, where 1 is Monday)
    final now = DateTime.now();
    final today = now.weekday;
    return dayOfWeek == today;
  }

  bool _isCurrentlyOpen() {
    final now = DateTime.now();
    final today = now.weekday;
    
    // Find today's working hours
    final todayHours = workingHours.firstWhere(
      (wh) => wh.dayOfWeek == today,
      orElse: () => WorkingHours(),
    );
    
    if (todayHours.openTime == null || todayHours.closeTime == null) {
      return false;
    }
    
    // Parse hours
    final openTime = TimeOfDay(
      hour: int.parse(todayHours.openTime!.split(':')[0]),
      minute: int.parse(todayHours.openTime!.split(':')[1]),
    );
    final closeTime = TimeOfDay(
      hour: int.parse(todayHours.closeTime!.split(':')[0]),
      minute: int.parse(todayHours.closeTime!.split(':')[1]),
    );
    
    // Convert current time to minutes since midnight
    final currentMinutes = now.hour * 60 + now.minute;
    final openMinutes = openTime.hour * 60 + openTime.minute;
    final closeMinutes = closeTime.hour * 60 + closeTime.minute;
    
    return currentMinutes >= openMinutes && currentMinutes <= closeMinutes;
  }

  String _formatHours(String? openTime, String? closeTime) {
    if (openTime == null || closeTime == null) {
      return tr('store_details.working_hours.closed_today');
    }
    
    return tr(
      'store_details.working_hours.open_hours',
      args: [openTime, closeTime],
    );
  }
}
