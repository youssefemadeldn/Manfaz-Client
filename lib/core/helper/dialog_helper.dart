import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:manfaz/core/theme/app_colors.dart';

class DialogHelper {
  static void showCustomDialog({
    required BuildContext context,
    required Widget title,
    required Widget content,
    TextStyle? leftActionStyle,
    TextStyle? rightActionStyle,
    TextStyle? contentStyle,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool isDismissible = true,
    Color? backgroundColor,
    EdgeInsetsGeometry? contentPadding,
    ShapeBorder? shape,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      barrierColor: Colors.black54,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: backgroundColor ?? Colors.white,
          shape: shape ?? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
          contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(24, 12, 24, 16),
          title: title,
          content: content,
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    if (onCancel != null) onCancel();
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: Text(
                    cancelText ?? 'dialog.cancel'.tr(),
                    style: leftActionStyle ?? TextStyle(
                      color: AppColors.primary.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    if (onConfirm != null) onConfirm();
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                  ),
                  child: Text(
                    confirmText ?? 'dialog.ok'.tr(),
                    style: rightActionStyle ?? TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  static void showLoadingDialog({
    required BuildContext context,
    String? loadingMessage,
    bool isDismissible = false,
    Color? indicatorColor,
    Color? textColor,
    double? indicatorSize,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      barrierColor: Colors.black54,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: indicatorSize ?? 45,
                  height: indicatorSize ?? 45,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: indicatorColor ?? AppColors.primary,
                  ),
                ),
                if (loadingMessage != null) ...[
                  const SizedBox(height: 20),
                  Text(
                    loadingMessage,
                    style: TextStyle(
                      color: textColor ?? Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static void hideDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
