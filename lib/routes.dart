import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/auth/auth_register_screen.dart';
import 'package:eco_reward_app/screens/auth/auth_login_screen.dart';
import 'package:eco_reward_app/screens/quest/main/quest_tab_screen.dart';
import 'package:eco_reward_app/screens/quest/detail/quest_detail_screen.dart';
import 'package:eco_reward_app/screens/quest/certification/quest_certification_screen.dart';
import 'package:eco_reward_app/screens/quest/gallery/quest_gallery_screen.dart';

final routes = {
  '/': (BuildContext context) => AuthLoginScreen(),
  '/login': (BuildContext context) => AuthLoginScreen(),
  '/account': (BuildContext context) => AuthRegisterScreen(),
  '/quest': (BuildContext context) => QuestTabScreen(),
  '/quest/detail': (BuildContext context) => QuestDetailScreen(),
  '/quest/certification': (BuildContext context) =>
      const QuestCertificationScreen(),
  '/quest/gallery': (BuildContext context) => const QuestGalleryScreen(),
};
