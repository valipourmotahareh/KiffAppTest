import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:kiff_app_test/config/constant/constants.dart';
import 'package:kiff_app_test/core/utils/extension.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(
    headers: {"Accept-Encoding": "gzip"},
    contentType: "application/json",
    baseUrl: Constants.baseUrl,
    sendTimeout: const Duration(seconds: 25),
  ));

  static final ApiClient _instance = ApiClient._init();

  factory ApiClient() => _instance;

  ApiClient._init() {
    initDio();
  }

  initDio() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: onError,
        onRequest: onRequest,
        onResponse: onResponse,
      ),
    );
  }

  void onRequest(options, handler) {
    switch (options.path) {
    }
    log(request: options);
    handler.next(options);
  }

  void onResponse(response, handler) {
    log(response: response);
    if ((response as Response).validateResponse()) handler.next(response);
  }

  void onError(error, handler) async {
    log(error: error);

    switch (error.response?.statusCode) {
      case 401:
        break;
      case 403:
        handler.reject(error);
        break;
      default:
        handler.reject(error);
        break;
    }
  }

  void setAccessToken(RequestOptions requestOptions) {
  }

  void setRefreshToken(RequestOptions requestOptions) {
  }

  void log({RequestOptions? request, Response<dynamic>? response, DioException? error}) async {
    Map<String, dynamic> logData = <String, dynamic>{
      if (request != null)
        'request': <String, dynamic>{
          'method': request.method,
          'path': request.path,
          if (request.contentType != 'multipart/form-data') 'data': request.data,
          'queryParameters': request.queryParameters,
          'headers': request.headers,
        },
      if (response != null)
        'response': <String, dynamic>{
          'data': response.data,
          'statusCode': response.statusCode,
        },
      if (error != null)
        'error': <String, dynamic>{
          'type': error.type.toString(),
          'error': error.error.toString(),
          'message': error.message,
        }
    };
    if (error != null) {
    } else {
    }
  }

  static Future<Response<dynamic>> retry(Dio dio, RequestOptions requestOptions) async {
    final Options options = Options(
      method: requestOptions.method,
      headers: dio.options.headers,
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  static void localLogout() {
    try {
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
