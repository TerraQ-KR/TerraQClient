import 'package:dio/dio.dart';

final InterceptorsWrapper custrom_interceptor = InterceptorsWrapper(
  onRequest: (request, handler) async {
    print('REQUEST[${request.method}] => PATH: ${request.path}');

    return handler.next(request);
  },
  onResponse: (response, handler) async {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

    return handler.next(response);
  },
  onError: (error, handler) async {
    print(
        'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}');

    return handler.next(error);
  },
);
