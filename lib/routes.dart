import 'package:flutter/material.dart';

import 'package:eco_reward_app/screens/auth/auth_register_screen.dart';
import 'package:eco_reward_app/screens/auth/auth_login_screen.dart';
import 'package:eco_reward_app/screens/quest/tab_page.dart';

final routes = {
  '/': (BuildContext context) => AuthLoginScreen(),
  '/login': (BuildContext context) => AuthLoginScreen(),
  '/account': (BuildContext context) => AuthRegisterScreen(),
  '/quest': (BuildContext context) => TabPage(),
};
