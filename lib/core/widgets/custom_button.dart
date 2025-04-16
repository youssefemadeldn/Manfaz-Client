import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color borderSideColor;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.backgroundColor,
    required this.borderSideColor,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
              color: borderSideColor, width: 1),
        ),
        elevation: 0,
        padding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 12.w),
      ),
      child: child,
    );
  }
}
