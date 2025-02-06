// import 'package:flutter/material.dart';

// class AppColors {
//   // Primary Colors
//   static const Color primary = Color(0xFF0068FF); // Purple
//   static const Color primaryLight = Color(0xFFBB86FC);
//   static const Color primaryDark = Color(0xFF3700B3);

//   // Secondary Colors
//   static const Color secondary = Color(0xFF03DAC6); // Teal
//   static const Color secondaryLight = Color(0xFF66FFF9);
//   static const Color secondaryDark = Color(0xFF018786);

//   // Neutral Colors
//   static const Color white = Colors.white;
//   static const Color black = Colors.black;
//   static const Color grey = Colors.grey;
//   static const Color green = Colors.green;
//   static const Color lightGrey = Color(0xFFF5F5F5);
//   static const Color darkGrey = Color(0xFF616161);

//   // Background Colors
//   static const Color background = Color(0xFFF2F6FF);
//   static const Color surface = Color(0xFFFFFFFF);

//   // Text Colors
//   // static const Color textPrimary = Colors.black87;
//   // static const Color textSecondary = Colors.black54;
//   static const Color textPrimary = Colors.white;
//   static const Color textSecondary = Color(0xFF2F4664);
//   static const Color textHint = Colors.black38;

//   // Button Colors
//   static const Color buttonPrimary = primary;
//   static const Color buttonSecondary = secondary;

//   // State Colors
//   static const Color error = Colors.red;
//   static const Color success = Colors.green;
//   static const Color warning = Colors.orange;
//   static const Color info = Colors.blue;

//   // Divider Colors
//   static const Color divider = Color(0xFFE0E0E0);

//   // MaterialColor for Theming
//   static const MaterialColor primarySwatch = MaterialColor(
//     0xFF6200EA,
//     <int, Color>{
//       50: Color(0xFFF2E7FE),
//       100: Color(0xFFD7BFFF),
//       200: Color(0xFFBB86FC),
//       300: Color(0xFF985EFF),
//       400: Color(0xFF7F39FB),
//       500: Color(0xFF6200EA),
//       600: Color(0xFF5600E8),
//       700: Color(0xFF3700B3),
//       800: Color(0xFF30009C),
//       900: Color(0xFF23036A),
//     },
//   );
// }
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF0068FF); // Blue
  static const Color primaryLight = Color(0xFF5A9CFF); // Light Blue
  static const Color primaryDark = Color(0xFF0041B3); // Dark Blue

  // Secondary Colors
  static const Color secondary =
      Color(0xFFFFC107); // Amber (for highlights or accents)
  static const Color secondaryLight = Color(0xFFFFD54F); // Lighter Amber
  static const Color secondaryDark = Color(0xFFFFA000); // Darker Amber
  static const Color secondaryMuted =
      Color(0xFFFFF8E1); // Muted Amber (for soft backgrounds)

  // Additional Accents
  static const Color accentGreen =
      Color(0xFF4CAF50); // Green for success or positive states
  static const Color accentRed = Color(0xFFF44336); // Red for errors or alerts
  static const Color accentOrange =
      Color(0xFFFF9800); // Orange for warnings or notices

  // Neutral Colors
  static const Color white = Colors.white;
  static const Color green = Colors.green;
  static const Color red = Colors.red ;
  static const Color black = Colors.black;
  static const Color grey = Color(0xFFB0B0B0); // Neutral grey
  static const Color lightGrey = Color(0xFFF5F5F5); // Light grey background
  static const Color darkGrey =
      Color(0xFF616161); // Dark grey for subtle elements

  // Background Colors
  static const Color background =
      Color(0xFFF2F6FF); // Soft light blue background
  static const Color backgroundSecondary =
      Color(0xFFFFF8E1); // Light muted amber for secondary sections
  static const Color surface = white; // Default white surface

  // Text Colors
  static const Color textPrimary =
      Color(0xFF2F4664); // Dark text for readability
  static const Color textSecondary = grey; // Secondary text color
  static const Color textHint = Colors.black38; // Hint text

  // Button Colors
  static const Color buttonPrimary = primary; // Blue buttons
  static const Color buttonSecondary = secondary; // Amber buttons
  static const Color buttonText = white; // White text for buttons

  // State Colors
  static const Color error = Colors.red;
  static const Color success = accentGreen;
  static const Color warning = accentOrange;
  static const Color info = primaryLight; // Light blue for informational states

  // Divider Colors
  static const Color divider = Color(0xFFE0E0E0);

  // MaterialColor for Theming
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF0068FF,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2196F3),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
}
