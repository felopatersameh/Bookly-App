import 'dart:developer';

import 'package:bookly/Core/network/app_end_point.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dioFirst;
  static late Dio dioSecond;

  static init() {
    dioFirst = Dio(
      BaseOptions(
        baseUrl: AppEndPoint.baseUrlBooks,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
    dioSecond = Dio(
      BaseOptions(
        baseUrl: AppEndPoint.baseUrlStripe,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );

    dioFirst.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add headers or perform any request-related tasks
          // log('Request[${options.method}] => PATH: ${options.path}');
          return handler.next(options); // Continue the request
        },
        onResponse: (response, handler) {
          // Handle responses
          // log('Response[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response); // Continue with the response
        },
        onError: (DioException e, handler) {
          // Handle errors
          // log('Error[${e.response?.statusCode}] => MESSAGE: ${e.message}');
          return handler.next(e); // Continue with the error
        },
      ),
    );

    dioSecond.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add headers or perform any request-related tasks
          log('Request[${options.method}] => PATH: ${options.path}');
          return handler.next(options); // Continue the request
        },
        onResponse: (response, handler) {
          // Handle responses
          log('Response[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response); // Continue with the response
        },
        onError: (DioException e, handler) {
          // Handle errors
          log('Error[${e.response?.statusCode}] => MESSAGE: ${e.message}');
          return handler.next(e); // Continue with the error
        },
      ),
    );
    // dio.interceptors.add(LogInterceptor(
    //   request: true,
    //   requestHeader: true,
    //   requestBody: true,
    //   responseHeader: true,
    //   responseBody: true,
    //   error: true,
    // ));
  }

  static Future<Response> getData({
    required String path,
    String? token,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    options ??= Options();
    if (token != null) {
      options.headers = {'Authorization': 'Bearer $token'};
    }
    return await dioFirst.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> postData({
    required String path,
    required dynamic data,
    String? token,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    options ??= Options(contentType: 'application/json');
    if (token != null) {
      options.headers = {'Authorization': 'Bearer $token'};
    }
    return await dioSecond.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> putData({
    required String path,
    required Map<String, dynamic> data,
    String? token,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    options ??= Options();
    if (token != null) {
      options.headers = {'Authorization': 'Bearer $token'};
    }
    return await dioFirst.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> deleteData({
    required String path,
    String? token,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    options ??= Options();
    if (token != null) {
      options.headers = {'Authorization': 'Bearer $token'};
    }
    return await dioFirst.delete(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
