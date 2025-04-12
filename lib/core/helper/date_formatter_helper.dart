import 'package:easy_localization/easy_localization.dart';

class DateAndTimeHelper {
  static String formatDate(String date) {
    try {
      final DateTime parsedDate = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      return date;
    }
  }
  
  /// Determines if the current time is morning or evening
  /// Returns true for morning (5:00 AM - 5:59 PM), false for evening (6:00 PM - 4:59 AM)
  static bool isMorning() {
    final now = DateTime.now();
    final hour = now.hour;
    
    // Morning is considered from 5:00 AM to 5:59 PM
    return hour >= 5 && hour < 18;
  }
  
  /// Gets the appropriate greeting based on time of day and locale
  static String getGreeting(String locale) {
    final bool morning = isMorning();
    
    if (locale == 'en') {
      return morning ? 'Good Morning' : 'Good Evening';
    } else if (locale == 'ar') {
      return morning ? 'صباح الخير' : 'مساء الخير';
    }
    
    // Default to English if locale is not recognized
    return morning ? 'Good Morning' : 'Good Evening';
  }
}
