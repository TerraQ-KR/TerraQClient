import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/auth/auth_register_screen.dart';
import 'package:eco_reward_app/screens/auth/auth_login_screen.dart';
import 'package:eco_reward_app/screens/quest/main/quest_tab_screen.dart';
import 'package:eco_reward_app/screens/quest/detail/quest_detail_screen.dart';
import 'package:eco_reward_app/screens/quest/certification/quest_certification_screen.dart';
import 'package:eco_reward_app/screens/quest/gallery/quest_gallery_screen.dart';

const String AuthLoginRoute = '/';
const String AuthRegisterRoute = '/account';
const String QuestTabRoute = '/quest';
const String QuestDetailRoute = '/quest/detail';
const String QuestCertificationRoute = '/quest/certification';
const String QuestGalleryRoute = '/quest/gallery';

Route<dynamic> RouteGenerater(RouteSettings settings) {
  switch (settings.name) {
    case AuthLoginRoute:
      return MaterialPageRoute(builder: (context) => AuthLoginScreen());
    case AuthRegisterRoute:
      return MaterialPageRoute(builder: (context) => AuthRegisterScreen());
    case QuestTabRoute:
      return MaterialPageRoute(builder: (context) => QuestTabScreen());
    case QuestDetailRoute:
      final args = settings.arguments as int;
      return MaterialPageRoute(
          builder: (context) => QuestDetailScreen(memDoId: args));
    case QuestCertificationRoute:
      return MaterialPageRoute(
          builder: (context) => const QuestCertificationScreen());
    case QuestGalleryRoute:
      return MaterialPageRoute(
          builder: (context) => const QuestGalleryScreen());
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
}
