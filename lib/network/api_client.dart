import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as res;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_exception.dart';
import 'app_config.dart';
import 'network_constants.dart';

class ApiClient {
  late Dio _dio;

  // final GetStorage _box = GetStorage();

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        // Dynamically set base URL
        sendTimeout: Duration(seconds: RequestTimeoutConstants.sendTimeout),
        connectTimeout: Duration(
          seconds: RequestTimeoutConstants.connectTimeout,
        ),
        receiveTimeout: Duration(
          seconds: RequestTimeoutConstants.receiveTimeout,
        ),
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
        // headers: {
        //   'Accept': 'application/json',
        // },
      ),
    );

    // Logging Interceptor for debugging
    _dio.interceptors.add(
      PrettyDioLogger(requestHeader: true, requestBody: true),
    );

    //  _dio.interceptors.add(ChuckerDioInterceptor());

    // Authentication Interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          return handler.reject(e);
        },
      ),
    );
  }

  Future<res.Response> get(
    String path, {
    Map<String, dynamic>? queryParams,
    required Function() retryCallback,
    Map<String, dynamic>? header,
  }) async {
    try {
      return await _dio.get(
        path ?? '',
        queryParameters: queryParams,
        options: Options(headers: header ?? defaultHeader()),
      );
    } catch (e) {
      throw ApiException.handleError(e, retryCallback);
    }
  }

  Future<res.Response> patch(
    String path, {
    Map<String, dynamic>? queryParams,
    required Function() retryCallback,
    Map<String, dynamic>? header,
    dynamic data,
  }) async {
    try {
      return await _dio.patch(
        path ?? '',
        queryParameters: queryParams,
        options: Options(headers: header ?? defaultHeader()),
        data: data,
      );
    } catch (e) {
      throw ApiException.handleError(e, retryCallback);
    }
  }

  Future<res.Response> post(
    String path, {
    dynamic data,
    required Function() retryCallback,
    Map<String, dynamic>? header,
  }) async {
    try {
      return await _dio.post(
        path ?? '',
        data: data,
        options: Options(headers: header ?? defaultHeader()),
      );
    } catch (e) {
      throw ApiException.handleError(e, retryCallback);
    }
  }

  Future<res.Response> put(
    String path, {
    dynamic data,
    required Function() retryCallback,
  }) async {
    try {
      return await _dio.put(path ?? '', data: data);
    } catch (e) {
      throw ApiException.handleError(e, retryCallback);
    }
  }

  Future<res.Response> delete(String path, Function() retryCallback) async {
    try {
      return await _dio.delete(path ?? '');
    } catch (e) {
      throw ApiException.handleError(e, retryCallback);
    }
  }

  Map<String, dynamic> headerWithAccessToken(String accessToken) {
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
  }

  Map<String, dynamic> defaultHeader() {
    return {'Accept': 'application/json'};
  }
}
