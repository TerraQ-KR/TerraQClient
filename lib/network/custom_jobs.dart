//ignore_for_file: strict_raw_type,constant_identifier_names,camel_case_types,prefer-async-await

import 'package:dio/dio.dart';
import 'package:fl_query/fl_query.dart';
import 'package:fl_query_hooks/fl_query_hooks.dart';
import 'package:flutter/foundation.dart';

import 'BasicAPI.dart';
/*

3. async cache & data invalidating할 수 있는 SSR
상태관리 라이브러리가 도입되야 합니다.
라이브러리가 loading state, onError,
onSuccess, stateKey, invalid 기능을 제공해야 합니다.

*/

final List<String> queryKeys = [];
final List<String> mutationKeys = [];

QueryJob customQueryJob({
  required String queryKey,
  required String path,
  int? retries,
  Duration? retryDelay,
  dynamic initialData,

  /// If set to false then the initial fetch will not be called & to
  /// start the process the user has to call the refetch first
  bool? enabled,

  // got from global options
  bool? refetchOnMount,
  bool? refetchOnReconnect,
  bool? refetchOnExternalDataChange,
  bool? keepPreviousData,
  Duration? staleTime,
  Duration? cacheTime,
  Duration? refetchInterval,

  // For api call
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  void Function(int, int)? onReceiveProgress,
  Function errFunction = stErrFunction,
}) {
  if (queryKeys.contains(queryKey)) {
    FlutterError("Use Unique queryKey");
  }
  queryKeys.add(queryKey);

  return QueryJob(
    queryKey: queryKey,
    task: ((queryKey, httpClient) {
      return API
          .GET(
            path: path,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          )
          .then((response) => response.data);
    }),
    retries: retries,
    retryDelay: retryDelay,
    initialData: initialData,

    /// If set to false then the initial fetch will not be called & to
    /// start the process the user has to call the refetch first
    enabled: enabled,

    // got from global options
    refetchOnMount: refetchOnMount,
    refetchOnReconnect: refetchOnReconnect,
    refetchOnExternalDataChange: refetchOnExternalDataChange,
    keepPreviousData: keepPreviousData,
    staleTime: staleTime,
    cacheTime: cacheTime,
    refetchInterval: refetchInterval,
  );
}

Query cachedQuery({
  required String queryKey,
  required String path,
  QueryListener<dynamic>? onData,
  QueryListener<dynamic>? onError,
  List<Object?>? keys,
  int? retries,
  Duration? retryDelay,
  dynamic initialData,

  /// If set to false then the initial fetch will not be called & to
  /// start the process the user has to call the refetch first
  bool? enabled,

  // got from global options
  bool? refetchOnMount,
  bool? refetchOnReconnect,
  bool? refetchOnExternalDataChange,
  bool? keepPreviousData,
  Duration? staleTime,
  Duration? cacheTime,
  Duration? refetchInterval,

  // For api call
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  void Function(int, int)? onReceiveProgress,
  Function errFunction = stErrFunction,
}) {
  var queryJob = customQueryJob(
    queryKey: queryKey,
    path: path,
    retries: retries,
    retryDelay: retryDelay,
    initialData: initialData,

    /// If set to false then the initial fetch will not be called & to
    /// start the process the user has to call the refetch first
    enabled: enabled,

    // got from global options
    refetchOnMount: refetchOnMount,
    refetchOnReconnect: refetchOnReconnect,
    refetchOnExternalDataChange: refetchOnExternalDataChange,
    keepPreviousData: keepPreviousData,
    staleTime: staleTime,
    cacheTime: cacheTime,
    refetchInterval: refetchInterval,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
    onReceiveProgress: onReceiveProgress,
    errFunction: errFunction,
  );

  return useQuery(
    job: queryJob,
    externalData: Null,
    onData: onData,
    onError: onError,
    keys: keys,
  );
}

MutationJob customMutaionJob({
  required String mutationKey,
  required String apiType,
  final int? retries,
  final Duration? retryDelay,
  final Duration? cacheTime,
  required String path,
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
  Function errFunction = stErrFunction,
}) {
  switch (apiType) {
    case "POST":
    case "post":
      return MutationJob(
        mutationKey: mutationKey,
        task: (key, data) async {
          return await API.POST(
              path: path,
              data: data,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceiveProgress,
              errFunction: errFunction);
        },
        retries: retries,
        retryDelay: retryDelay,
        cacheTime: cacheTime,
      );
    case "PUT":
    case "put":
      return MutationJob(
        mutationKey: mutationKey,
        task: (key, data) async {
          return await API.PUT(
              path: path,
              data: data,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceiveProgress,
              errFunction: errFunction);
        },
        retries: retries,
        retryDelay: retryDelay,
        cacheTime: cacheTime,
      );
    case "delete":
    case "DELETE":
      return MutationJob(
        mutationKey: mutationKey,
        task: (key, data) async {
          return await API.DELETE(
              path: path,
              data: data,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              errFunction: errFunction);
        },
        retries: retries,
        retryDelay: retryDelay,
        cacheTime: cacheTime,
      );
    case "patch":
    case "PATCH":
      return MutationJob(
        mutationKey: mutationKey,
        task: (key, data) async {
          return await API.PATCH(
              path: path,
              data: data,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceiveProgress,
              errFunction: errFunction);
        },
        retries: retries,
        retryDelay: retryDelay,
        cacheTime: cacheTime,
      );

    default:
      throw FlutterError(
          "$apiType is not a method of API. Try (put, post, delete)");
  }
}

Mutation cachedMutation({
  required String mutationKey,
  required String apiType,
  final int? retries,
  final Duration? retryDelay,
  final Duration? cacheTime,
  required String path,
  MutationListener<dynamic, dynamic>? onData,
  MutationListener<dynamic, dynamic>? onError,
  MutationListenerReturnable<dynamic, dynamic>? onMutate,
  dynamic data,
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
  Function errFunction = stErrFunction,
}) {
  var mutationJob = customMutaionJob(
    mutationKey: mutationKey,
    apiType: apiType,
    path: path,
    retries: retries,
    retryDelay: retryDelay,
    cacheTime: cacheTime,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
    onSendProgress: onSendProgress,
    onReceiveProgress: onReceiveProgress,
    errFunction: stErrFunction,
  );

  return useMutation(
    job: mutationJob,
    onData: onData,
    onError: onError,
    onMutate: onMutate,
  );
}
