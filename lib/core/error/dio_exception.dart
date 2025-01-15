import 'package:dio/dio.dart';

class DioExceptions {
  static bool isServerError(DioException dioError) {
    return dioError.response != null &&
        dioError.response!.statusCode != null &&
        dioError.response!.statusCode! >= 400 &&
        dioError.response!.statusCode! < 500;
  }
}
