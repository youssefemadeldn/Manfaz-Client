import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showSuccessSnackBar(
    BuildContext context, {
    required String message,
  }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.green.shade800,
      icon: Icons.check_circle_outline,
    );
  }

  static void showErrorSnackBar(
    BuildContext context, {
    required String message,
  }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.red.shade800,
      icon: Icons.error_outline,
    );
  }

  static void showWarningSnackBar(
    BuildContext context, {
    required String message,
  }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.orange.shade800,
      icon: Icons.warning_amber_rounded,
    );
  }

  static void showInfoSnackBar(
    BuildContext context, {
    required String message,
  }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.blue.shade800,
      icon: Icons.info_outline,
    );
  }

  static void _showSnackBar(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 4),
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        action: SnackBarAction(
          label: 'snackbar.dismiss'.tr(),
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}