//ignore_for_file: strict_raw_type,constant_identifier_names,camel_case_types

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fquery/fquery.dart';

import 'BasicAPI.dart';

/*

3. async cache & data invalidating할 수 있는 SSR
상태관리 라이브러리가 도입되야 합니다.
라이브러리가 loading state, onError,
onSuccess, stateKey, invalid 기능을 제공해야 합니다.

*/

List<String> QueryKeys = [];

class ServerState extends HookWidget {
  final client = useQueryClient();
  late String path;
  late String queryKey;

  ServerState({
    super.key,
    required String path,
    required String queryKey,
  }) {
    if (QueryKeys.contains(queryKey)) {
      AssertionError("$queryKey has been matched with other API Calls");
    }
  }

  Future<Response<dynamic>> apiFunc() async {
    return API.GET(path: path);
  }

  void invalidateData({
    required String queryKey,
  }) {
    if (!QueryKeys.contains(queryKey)) {
      AssertionError("$queryKey mismatched");
    }
    client.invalidateQueries([queryKey], exact: true);
  }

  @override
  Widget build(BuildContext context) {
    final res = useQuery(
      [queryKey],
      apiFunc,
      staleDuration: const Duration(seconds: 10),
    );

    return Builder(builder: (context) {
      if (res.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (res.isError) {
        return const Center(child: Text("Error"));
      }

      return const Text(" ");
    });
  }
}

// enum ServerState {
//   Loading,
//   Error,
//   Success,
// }

// final queryClient = useQueryClient();

// ServerState responseState({
//   required String queryKey,
//   required String path,
// }) {
//   if (QueryKeys.contains(queryKey)) {
//     AssertionError("$queryKey has been matched with other API Calls");
//   }

//   Future<Response<dynamic>> test() async {
//     return API.GET(path: path);
//   }

//   final posts = useQuery([queryKey], test);
//   if (posts.isLoading) {
//     print("Loading....");

//     return ServerState.Loading;
//   } else if (posts.isError) {
//     print("Error Occured!!");

//     return ServerState.Error;
//   }
//   QueryKeys.add(queryKey);
//   print("Success!!");

//   return ServerState.Success;
// }

// void invalidateData({
//   required String queryKey,
// }) {
//   if (!QueryKeys.contains(queryKey)) {
//     AssertionError("$queryKey mismatched");
//   }
//   queryClient.invalidateQueries([queryKey], exact: true);
// }
