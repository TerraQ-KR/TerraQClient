import 'package:dio/dio.dart';

final BasicAPI API = BasicAPI();

void stErrFunction(dynamic e) {
  print("NetworkError");
}

Response<dynamic> stResFunction(Response<dynamic> res) {
  return res;
}

class BasicAPI {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://35.216.34.93:8080/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  // ignore: non_constant_identifier_names
  dynamic GET({
    required String path,
    Map<String, dynamic>? quiryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    Function resFunction = stResFunction,
    Function errFunction = stErrFunction,
  }) async {
    try {
      var res = await dio.get(
        path,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return resFunction(res);
    } catch (e) {
      return errFunction(e);
    }
  }

  dynamic POST({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Function resFunction = stResFunction,
    Function errFunction = stErrFunction,
  }) async {
    try {
      var res = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return resFunction(res);
    } catch (e) {
      return errFunction(e);
    }
  }

  dynamic PUT(
    String path, {
    required data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Function resFunction = stResFunction,
    Function errFunction = stErrFunction,
  }) async {
    try {
      var res = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return resFunction(res);
    } catch (e) {
      return errFunction(e);
    }
  }

  dynamic DELETE(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    Function resFunction = stResFunction,
    Function errFunction = stErrFunction,
  }) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return resFunction(res);
    } catch (e) {
      return errFunction(e);
    }
  }
}
