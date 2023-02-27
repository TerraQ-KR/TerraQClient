import 'package:flutter/material.dart';

import 'package:eco_reward_app/screens/auth/auth_register_screen.dart';
import 'package:eco_reward_app/screens/auth/auth_login_screen.dart';
import 'package:eco_reward_app/screens/quest/main/tab_page.dart';
import 'package:eco_reward_app/screens/quest/detail/quest_detail_screen.dart';
import 'package:eco_reward_app/screens/quest/detail/quest_certification_screen.dart';
import 'package:eco_reward_app/screens/quest/detail/quest_status_screen.dart';

final routes = {
  '/': (BuildContext context) => AuthLoginScreen(),
  '/login': (BuildContext context) => AuthLoginScreen(),
  '/account': (BuildContext context) => AuthRegisterScreen(),
  '/quest': (BuildContext context) => TabPage(),
  '/quest/detail': (BuildContext context) => QuestDetailScreen(),
  '/quest/certification': (BuildContext context) => QuestCertificationScreen(),
  '/quest/status': (BuildContext context) => QuestStatusScreen(),
};
