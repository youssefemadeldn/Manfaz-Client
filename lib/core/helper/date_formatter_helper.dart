import 'package:easy_localization/easy_localization.dart';

class DateFormatterHelper {
  static String formatDate(String date) {
    try {
      final DateTime parsedDate = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      return date;
    }
  }
}
