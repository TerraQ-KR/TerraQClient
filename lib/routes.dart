import 'package:flutter/material.dart';

import 'package:eco_reward_app/screens/auth/auto_register_screen.dart';
import 'package:eco_reward_app/screens/auth/auto_login_screen.dart';

final routes = {
  '/': (BuildContext context) => AutoLoginScreen(),
  '/login': (BuildContext context) => AutoLoginScreen(),
  '/account': (BuildContext context) => AutoRegisterScreen(),
};
