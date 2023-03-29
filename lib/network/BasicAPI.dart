// ignore_for_file: strict_raw_type,non_constant_identifier_names

import 'package:dio/dio.dart';
import 'custom_log.dart';

final API = BasicAPI();

String stErrFunction(DioError e) {
  switch (e.message) {
    //register error
    case "CREATE-USER-ERR-500":
    //login error
    case "LOGIN-ERR-500":
    // member error
    case "MEMBER-ERR-500":
    // category error
    case "CATEGORY-ERR-500":
    // quest error
    case "QUEST-ERR-500":
    // member do error
    case "MEM_DO-ERR-500":
    // badge error
    case "BADGE-SUPERUSER-ERROR":
    default:
      return e.message;
  }
}

//option이 헤더
class BasicAPI {
  late Dio dio;

  final String baseUrl = "http://35.216.99.147:8080/api";

  BasicAPI() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = Dio(options);
    dio.interceptors.add(
      custrom_interceptor,
    );
  }

  Future<Response> GET({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    Function errFunction = stErrFunction,
  }) async {
    Response res;

    try {
      res = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      throw stErrFunction(e);
    }

    return res;
  }

  Future<Response> POST({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Function errFunction = stErrFunction,
  }) async {
    Response res;

    try {
      res = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      throw stErrFunction(e);
    }

    return res;
  }

  dynamic PUT({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Function errFunction = stErrFunction,
  }) async {
    Response res;

    try {
      res = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      throw stErrFunction(e);
    }

    return res;
  }

  dynamic DELETE({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    Function errFunction = stErrFunction,
  }) async {
    Response res;

    try {
      res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      throw stErrFunction(e);
    }

    return res;
  }

  dynamic PATCH({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required Function errFunction,
  }) async {
    Response res;

    try {
      res = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      throw stErrFunction(e);
    }

    return res;
  }
}
