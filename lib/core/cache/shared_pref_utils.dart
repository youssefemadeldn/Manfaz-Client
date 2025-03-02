import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static late SharedPreferences sharedPreferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // Save data of various types
  static Future<void> saveData(
      {required String key, required dynamic data}) async {
    if (data is int) {
      await sharedPreferences.setInt(key, data);
    } else if (data is String) {
      await sharedPreferences.setString(key, data);
    } else if (data is bool) {
      await sharedPreferences.setBool(key, data);
    } else if (data is double) {
      await sharedPreferences.setDouble(key, data);
    } else {
      throw Exception('Invalid data type');
    }
  }

  // Retrieve data
  static dynamic getData(String key) {
    return sharedPreferences.get(key);
  }

  // Remove data
  static Future<void> removeData(String key) async {
    await sharedPreferences.remove(key);
  }
}
