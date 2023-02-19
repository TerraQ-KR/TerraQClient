import 'package:eco_reward_app/style/default_theme.dart';
import 'package:flutter/material.dart';
import './screens/login/login_screen.dart';
// import './screens/login/account_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}
