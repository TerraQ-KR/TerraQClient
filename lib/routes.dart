import 'package:eco_reward_app/network/provider/test_screen.dart';
import 'package:flutter/material.dart';

import 'package:eco_reward_app/screens/auth/auth_register_screen.dart';
import 'package:eco_reward_app/screens/auth/auth_login_screen.dart';
import 'package:eco_reward_app/screens/home/home_screen.dart';

final routes = {
  '/': (BuildContext context) => const TestWidget(),
  '/login': (BuildContext context) => AuthLoginScreen(),
  '/account': (BuildContext context) => AuthRegisterScreen(),
  '/home': (BuildContext context) => const HomeScreen(),
};
