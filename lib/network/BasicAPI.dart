// ignore_for_file: strict_raw_type,non_constant_identifier_names

import 'package:dio/dio.dart';
import 'custom_log.dart';

final API = BasicAPI();

void stErrFunction(dynamic e) {
  print("Unexpected Error has been ocurred");
}

//option이 헤더
class BasicAPI {
  late Dio dio;

  final String baseUrl = "http://localhost:8080/";

  BasicAPI() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 3000,
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
      throw Exception(e.message);
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
      throw Exception(e.message);
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
      throw Exception(e.message);
    }
  }

  dynamic DELETE({
    required String path,
    required String data,
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
      throw Exception(e.message);
    }

    return res;
  }
}
