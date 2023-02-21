import 'package:dio/dio.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: 'http://localhost:8080',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ),
);
