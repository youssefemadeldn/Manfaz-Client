import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:manfaz/core/network/api_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );
  }

  Future<Response> getData(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      ApiConstant.baseUrl + endpoint,
      queryParameters: queryParameters,
      options: Options(
        validateStatus: (status) => true,
      ),
    );
  }

  Future<Response> postData(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.post(
      ApiConstant.baseUrl + endpoint,
      data: body,
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }

  Future<Response> deleteData(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.delete(
      ApiConstant.baseUrl + endpoint,
      data: body,
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }

  Future<Response> updateData(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.put(
      ApiConstant.baseUrl + endpoint,
      data: body,
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }
}
