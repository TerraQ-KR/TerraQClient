import 'package:flutter/material.dart';
import 'package:eco_reward_app/routes.dart';

import 'network/provider/test_api.dart';

void main() {
  getTest();
  postTest();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco Reward',
      routes: routes,
    );
  }
}
