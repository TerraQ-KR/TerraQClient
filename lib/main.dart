import 'package:eco_reward_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/routes.dart' as router;
import 'package:fl_query/fl_query.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return QueryBowlScope(
      bowl: QueryBowl(),
      child: MaterialApp(
        title: 'Eco Reward',
        onGenerateRoute: router.RouteGenerater,
        initialRoute: AuthLoginRoute,
      ),
    );
  }
}
