import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_styles.dart';

class RateJobTimeExperience extends StatelessWidget {
  const RateJobTimeExperience({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          color: Color(0XFFEDEBE7),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              children: [
                Icon(
                  Icons.star_border_rounded,
                  // color: Colors.yellow,
                  size: 32.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '4.9',
                  style: AppStyles.bodyText2,
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          color: Color(0XFFEDEBE7),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              children: [
                Icon(
                  Icons.alarm_sharp,
                  // color: Colors.yellow,
                  size: 30.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Part Time',
                  style: AppStyles.bodyText2,
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          color: Color(0XFFEDEBE7),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              children: [
                Icon(
                  Icons.work_history_outlined,
                  // color: Colors.yellow,
                  size: 30.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '5+years',
                  style: AppStyles.bodyText2,
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
