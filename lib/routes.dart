import 'package:flutter/material.dart';

import 'package:eco_reward_app/screens/login/account_screen.dart';
import 'package:eco_reward_app/screens/login/login_screen.dart';

final routes = {
  '/': (BuildContext context) => LoginPage(),
  '/login': (BuildContext context) => LoginPage(),
  '/account': (BuildContext context) => AccountPage(),
};
