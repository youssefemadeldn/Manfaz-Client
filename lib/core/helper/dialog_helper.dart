import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:manfaz/core/theme/app_colors.dart';

class DialogHelper {
  // Static method to show a dialog with customizable parameters
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
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: title,
          content: content,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss dialog
                if (onCancel != null) onCancel();
              },
              child: Text(
                cancelText ?? 'dialog.cancel'.tr(),
                style: leftActionStyle ??  TextStyle(
                  color: AppColors.primary,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss dialog
                if (onConfirm != null) onConfirm();
              },
              child: Text(
                confirmText ?? 'dialog.ok'.tr(),
                style: rightActionStyle ??  TextStyle(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Method to show a loading indicator dialog
  static void showLoadingDialog({
    required BuildContext context,
    String? loadingMessage,
    bool isDismissible = false,
    Color? indicatorColor,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: indicatorColor ?? Colors.purple,
              ),
              const SizedBox(height: 16),
              Text(
                loadingMessage ?? 'dialog.loading'.tr(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }

  // Method to hide the loading dialog
  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  // Method to hide the loading dialog
  static void hideDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
