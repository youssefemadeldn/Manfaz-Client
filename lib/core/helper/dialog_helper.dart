import 'package:flutter/material.dart';

class DialogHelper {
  // Static method to show a dialog with customizable parameters
  static void showCustomDialog({
    required BuildContext context,
    required Widget title,
    required Widget content,
    TextStyle? leftActionStyle,
    TextStyle? rightActionStyle,
    TextStyle? contentStyle,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: title
          // Text(
          //   title,
          //   style: titleStyle ?? const TextStyle(),
          // )
          ,
          content: content,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss dialog
                if (onCancel != null) onCancel();
              },
              child: Text(
                cancelText,
                style: leftActionStyle ?? const TextStyle(),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss dialog
                if (onConfirm != null) onConfirm();
              },
              child: Text(
                confirmText,
                style: rightActionStyle ?? const TextStyle(),
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
    String loadingMessage = 'Loading...',
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
                loadingMessage,
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
