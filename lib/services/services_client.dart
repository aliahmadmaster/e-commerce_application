import 'package:dio/dio.dart';
import 'package:ecommerce_user/constants/end_points.dart';
import 'package:ecommerce_user/services/service_exceptions.dart';

class ServiceClient {
  ServiceClient() {
    _dio = Dio(options);

    initializeInterceptors();
  }
  Dio _dio;
  static BaseOptions options = new BaseOptions(
    baseUrl: Endpoints.baseUrl,
    connectTimeout: Endpoints.connectionTimeout,
    receiveTimeout: Endpoints.receiveTimeout,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    Response response;
    try {
      response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (dioError) {
      throw ServiceExceptions.fromDioError(dioError);
    }
    // final results = List<Map<String, dynamic>>.from(response.data['results']);
    return response;
  }

  Future<dynamic> post(
    String endpoint, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    Response response;
    try {
      response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (dioError) {
      throw ServiceExceptions.fromDioError(dioError);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(onError: (error, handler) {
        print(
            'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}');
      }, onRequest: (options, handler) {
        print('REQUEST[${options.method}] => PATH: ${options.path}');
      }, onResponse: (response, handler) {
        print(
            'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      }),
    );
  }
}
