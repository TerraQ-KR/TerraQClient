import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../custom_jobs.dart';

class TestWidget extends HookWidget {
  const TestWidget({super.key});

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

// GET메소드 한번만 불러와지는거 확인.
