// ignore_for_file: unused_import,non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:eco_reward_app/network/provider/test_screen.dart';
import 'package:eco_reward_app/screens/auth/auth_register_screen.dart';
import 'package:eco_reward_app/screens/auth/auth_login_screen.dart';
import 'package:eco_reward_app/screens/quest/main/quest_tab_screen.dart';
import 'package:eco_reward_app/screens/quest/detail/quest_detail_screen.dart';
import 'package:eco_reward_app/screens/quest/certification/quest_certification_screen.dart';
import 'package:eco_reward_app/screens/quest/gallery/quest_gallery_screen.dart';
import 'package:eco_reward_app/screens/quest/main/widget/input_quest_common.dart';
import 'package:eco_reward_app/screens/home/home_screen.dart';
import 'package:eco_reward_app/screens/profile/profile_screen.dart';

// query_parameter keys for Route
class Routes {
  static const AuthLoginRoute = '/';
  static const AuthRegisterRoute = '/account';
  static const QuestTabRoute = '/quest';
  static const QuestDetailRoute = '/quest/detail';
  static const QuestCertificationRoute = '/quest/certification';
  static const QuestGalleryRoute = '/quest/gallery';
  static const login = '/login';
  static const account = '/account';
  static const home = '/home';
  static const test = '/test';
  static const memberKey = "mid";

  static Route<dynamic> RouteGenerater(RouteSettings settings) {
    Uri uri = Uri.parse(settings.name ?? "");
    Map<String, dynamic> params = {};
    uri.queryParameters.forEach((key, value) {
      if (key != memberKey) {
        throw ArgumentError("Router QueryKey is invalid");
      }
      params[key] = int.tryParse(value) ?? value;
    });

    return MaterialPageRoute(
        builder: (context) {
          switch (uri.path) {
            case AuthLoginRoute:
              return AuthLoginScreen();
            case AuthRegisterRoute:
              return AuthRegisterScreen();
            case QuestTabRoute:
              return QuestTabScreen();
            case QuestCertificationRoute:
              return QuestCertificationScreen();
            case QuestGalleryRoute:
              return QuestGalleryScreen();
            case home:
              return const HomeScreen();
            case test:
              if (params.isNotEmpty) {
                return const testOtherScreen();
              }
              return TestWidget();
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
        },
        settings: RouteSettings(name: settings.name));
  }
}

Map<String, String> QueryParams(BuildContext context) {
  String? current_route = ModalRoute.of(context)!.settings.name;
  var uri = Uri.parse(current_route ?? "");

  return uri.queryParameters;
}

String RouteParams({
  required String path,
  Map<String, dynamic>? queryParameters,
}) {
  return Uri(path: path, queryParameters: queryParameters).toString();
}

class Arguments {
  late final int mid;
  Arguments(Map<String, String> map) {
    mid = int.parse(map[Routes.memberKey] ?? "");
  }
}
