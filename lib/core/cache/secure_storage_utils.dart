// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class SecureStorageUtils {
//   static late FlutterSecureStorage storage;

//   static void init() {
//     storage = const FlutterSecureStorage();
//   }

//   /// Save a value to secure storage
//   static Future<void> writeValue(
//       {required String key, required String value}) async {
//     try {
//       await storage.write(key: key, value: value);
//     } catch (e) {
//       throw Exception("Error writing value: $e");
//     }
//   }

//   /// Read a value from secure storage
//   static Future<String?> readValue(String key) async {
//     try {
//       return await storage.read(key: key);
//     } catch (e) {
//       throw Exception("Error reading value: $e");
//     }
//   }

//   /// Delete a value from secure storage
//   static Future<void> deleteValue(String key) async {
//     try {
//       await storage.delete(key: key);
//     } catch (e) {
//       throw Exception("Error deleting value: $e");
//     }
//   }

//   /// Clear all values from secure storage
//   static Future<void> clearAll() async {
//     try {
//       await storage.deleteAll();
//     } catch (e) {
//       throw Exception("Error clearing all values: $e");
//     }
//   }
// }
