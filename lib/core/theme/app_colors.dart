import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Colors.green; // Purple
  static const Color primaryLight = Color(0xFFBB86FC);
  static const Color primaryDark = Color(0xFF3700B3);

  // Secondary Colors
  static const Color secondary = Color(0xFF03DAC6); // Teal
  static const Color secondaryLight = Color(0xFF66FFF9);
  static const Color secondaryDark = Color(0xFF018786);

  // Neutral Colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color green = Colors.green;
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color darkGrey = Color(0xFF616161);

  // Background Colors
  static const Color background = Color(0xFFF7F7F7);
  static const Color surface = Color(0xFFFFFFFF);

  // Text Colors
  // static const Color textPrimary = Colors.black87;
  // static const Color textSecondary = Colors.black54;
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.black54;
  static const Color textHint = Colors.black38;

  // Button Colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;

  // State Colors
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color info = Colors.blue;

  // MaterialColor for Theming
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF6200EA,
    <int, Color>{
      50: Color(0xFFF2E7FE),
      100: Color(0xFFD7BFFF),
      200: Color(0xFFBB86FC),
      300: Color(0xFF985EFF),
      400: Color(0xFF7F39FB),
      500: Color(0xFF6200EA),
      600: Color(0xFF5600E8),
      700: Color(0xFF3700B3),
      800: Color(0xFF30009C),
      900: Color(0xFF23036A),
    },
  );
}
