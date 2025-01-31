import 'package:flutter/material.dart';

class BottomSheetHelper {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
    double? maxHeight,
    double? minHeight,
    Color backgroundColor = Colors.white,
    ShapeBorder? shape,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      // useSafeArea: true,

      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
          ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: maxHeight != null
              ? (maxHeight / MediaQuery.of(context).size.height)
              : null,
          child: child,
        );
      },
    );
  }
}
