import 'package:flutter/material.dart';
import 'package:eco_reward_app/routes.dart';
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
      child: const MaterialApp(
        title: 'Eco Reward',
        onGenerateRoute: Routes.RouteGenerater,
        initialRoute: Routes.QuestTabRoute,
      ),
    );
  }
}
