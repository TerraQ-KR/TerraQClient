import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/routes.dart';

class TutorialScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var mid = Arguments(QueryParams(context)).mid;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => navigateToStart(context, mid),
          child: Text('Show Dialog'),
        ),
      ),
    );
  }
}

navigateToStart(context, mid) => Navigator.pushNamed(
    context,
    RouteParams(
        path: Routes.start,
        queryParameters: {Routes.memberKey: mid.toString()}));
