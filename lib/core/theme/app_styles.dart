// // import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'app_colors.dart'; // Import AppColors

// class AppStyles {
//   // Header Styles
//   static TextStyle header1 = TextStyle(
//     fontSize: 24.sp,
//     fontWeight: FontWeight.bold,
//     color: AppColors.textPrimary,
//   );

//   static TextStyle header2 = TextStyle(
//     fontSize: 20.sp,
//     fontWeight: FontWeight.w600,
//     color: AppColors.textPrimary,
//   );

//   static TextStyle header3 = TextStyle(
//     fontSize: 18.sp,
//     fontWeight: FontWeight.w500,
//     color: AppColors.textPrimary,
//   );

//   // Body Text Styles
//   static TextStyle bodyText1 = TextStyle(
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w400,
//     color: AppColors.textSecondary,
//   );

//   static TextStyle bodyText2 = TextStyle(
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w400,
//     color: AppColors.textSecondary,
//   );

//   static TextStyle bodyText3 = TextStyle(
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w400,
//     color: AppColors.textSecondary,
//   );

//   static TextStyle bodyTextBold = TextStyle(
//     fontSize: 14.sp,
//     fontWeight: FontWeight.bold,
//     color: AppColors.textPrimary,
//   );

//   // Caption Styles
//   static TextStyle caption = TextStyle(
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w400,
//     color: AppColors.grey,
//   );

//   static TextStyle smallText = TextStyle(
//     fontSize: 10.sp,
//     fontWeight: FontWeight.w400,
//     color: AppColors.lightGrey,
//   );

//   // Button Text Styles
//   static TextStyle buttonText = TextStyle(
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w600,
//     color: AppColors.white,
//   );

//   static TextStyle buttonTextPrimary = TextStyle(
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w600,
//     color: AppColors.primary,
//   );

//   // Link Text Styles
//   static TextStyle linkText = TextStyle(
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w400,
//     color: AppColors.secondary,
//     decoration: TextDecoration.underline,
//   );

//   // State Text Styles
//   static TextStyle errorText = TextStyle(
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w500,
//     color: AppColors.error,
//   );

//   static TextStyle successText = TextStyle(
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w500,
//     color: AppColors.success,
//   );

//   static TextStyle warningText = TextStyle(
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w500,
//     color: AppColors.warning,
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart'; // Import AppColors

class AppStyles {
  // General Font Family
  static const String fontFamily =
      "Poppins"; // Replace with your font family if different.

  // Header Styles
  static TextStyle header1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle header2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle header3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Subtitle Styles
  static TextStyle subtitle1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle subtitle2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // Body Text Styles
  static TextStyle bodyText1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyText2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle bodyText3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static TextStyle bodyTextBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Caption Styles
  static TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static TextStyle smallText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGrey,
  );

  // Button Text Styles
  static TextStyle buttonText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle buttonTextPrimary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static TextStyle buttonTextSecondary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );

  // Link Text Styles
  static TextStyle linkText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
    decoration: TextDecoration.underline,
  );

  // State Text Styles
  static TextStyle errorText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.error,
  );

  static TextStyle successText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.success,
  );

  static TextStyle warningText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.warning,
  );

  // Title Text Styles
  static TextStyle appBarTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle cardTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryDark,
  );

  static TextStyle cardSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // Custom Styles for Your App
  static TextStyle priceTag = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.success,
  );

  static TextStyle badgeText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}
