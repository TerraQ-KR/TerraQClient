import 'package:dio/dio.dart';
import 'package:eco_reward_app/network/BasicAPI.dart';
import 'package:fl_query_hooks/fl_query_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fl_query/fl_query.dart';

import '../custom_jobs.dart';

class UseQueryWidget extends HookWidget {
  const UseQueryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final testQuery = cachedQuery(
      queryKey: "getTest",
      path: "/getTest",
    );

    if (!testQuery.hasData || testQuery.isLoading || testQuery.isRefetching) {
      return const CircularProgressIndicator();
    }

    return Column(
      children: [
        Row(
          children: [
            Text(testQuery.data as String),
            ElevatedButton(
              child: const Text("Refetch"),
              // ignore: prefer-extracting-callbacks
              onPressed: () async {
                await testQuery.refetch();
              },
            ), // Text
          ],
        ),
        const testOtherScreen(),
      ],
    );
  }
}

// ignore: camel_case_types
// ignore: prefer-single-widget-per-file, camel_case_types
class testOtherScreen extends HookWidget {
  const testOtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final testQuery = cachedQuery(
      queryKey: "getTest",
      path: "/getTest",
    );
    if (!testQuery.hasData || testQuery.isLoading || testQuery.isRefetching) {
      return Container();
    }

    return Row(
      children: [
        Text(testQuery.data as String),
        ElevatedButton(
          child: const Text("Refetch"),
          // ignore: prefer-extracting-callbacks
          onPressed: () async {
            await testQuery.refetch();
          },
        ), // Text
      ],
    );
  }
}

// ignore: prefer-single-widget-per-file
class TestWidget extends HookWidget {
  TestWidget({super.key});

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mutationjob = MutationJob(
        mutationKey: "test",
        task: (key, data) async {
          final Response<dynamic> response =
              await API.POST(path: "/postTest", data: data);
          // ignore: newline-before-return
          return response;
        });
    final mutation = useMutation(job: mutationjob);

    // final mutation = cachedMutation(
    //   mutationKey: "postTest",
    //   apiType: "post",
    //   path: "/postTest",
    // );

    return Scaffold(
      body: Column(
        children: [
          TextField(controller: myController),
          TextButton(
            // ignore: prefer-extracting-callbacks
            onPressed: () {
              mutation.mutate(
                myController.text,
                onData: (payload, variables, context) {
                  myController.text = "";
                },
              );
            },
            child: const Text("submit"),
          ),
          if (mutation.hasData) Text("Response = ${mutation.data}")
        ],
      ),
    );
  }
}
