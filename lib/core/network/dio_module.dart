// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:manfaz/core/network/api_constant.dart';
// import 'package:manfaz/core/network/rest_client.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// @module
// abstract class DioModule {
//   @lazySingleton
//   Dio provideDio() {
//     final dio = Dio(
//       BaseOptions(
//         baseUrl: ApiConstant.baseUrl,
//         connectTimeout: const Duration(seconds: 30),
//         receiveTimeout: const Duration(seconds: 30),
//         validateStatus: (status) => true,
//       ),
//     );

//     dio.options.headers = {
//       'Accept': 'application/json',
//       'Authorization':
//           'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzM2MzE3MzI1LCJleHAiOjE3MzY0MDM3MjUsIm5iZiI6MTczNjMxNzMyNSwianRpIjoiNXVGQVNiSEd0dFZ2OG1NaiIsInN1YiI6IjI2NDkiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.2hTfbD7j-PrRZD17AxICxHu1lri-zxbcs928BL1QFJE',
//     };
//     dio.interceptors
//         .add(PrettyDioLogger(requestBody: true, requestHeader: true));
//     return dio;
//   }

//   @lazySingleton
//   RestClient provideRestClient(Dio dio) => RestClient(dio);
// }
