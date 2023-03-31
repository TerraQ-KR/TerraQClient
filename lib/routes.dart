// ignore_for_file: unused_import,non_constant_identifier_names

import 'package:eco_reward_app/network/provider/test_screen.dart';
import 'package:eco_reward_app/screens/Logo.dart';
import 'package:eco_reward_app/screens/profile/mybadges.dart';
import 'package:eco_reward_app/screens/profile/myreport.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/network/provider/test_screen.dart';
import 'package:eco_reward_app/screens/home/home_navigatorbar.dart';
import 'package:eco_reward_app/screens/auth/auth_register_screen.dart';
import 'package:eco_reward_app/screens/auth/auth_login_screen.dart';
import 'package:eco_reward_app/screens/quest/main/quest_tab_screen.dart';
import 'package:eco_reward_app/screens/quest/detail/quest_detail_screen.dart';
import 'package:eco_reward_app/screens/quest/gallery/quest_gallery_screen.dart';
import 'package:eco_reward_app/screens/quest/main/widget/input_quest_common.dart';
import 'package:eco_reward_app/screens/quest/certification/utils/certificate_modal.dart';
import 'package:eco_reward_app/screens/quest/certification/quest_image_screen.dart';
import 'package:eco_reward_app/screens/home/home_screen.dart';

import 'package:eco_reward_app/screens/profile/profile_screen.dart';
import 'package:eco_reward_app/screens/home/home_navigatorbar.dart';
import 'package:eco_reward_app/screens/tutorial/tutorial_screen.dart';
import 'package:eco_reward_app/screens/tutorial/mbti_screen.dart';
import 'package:eco_reward_app/screens/profile/leaderboard.dart';

// query_parameter keys for Route
class Routes {
  static const start = '/';
  static const tutorial = '/tutorial';
  static const logo = '/logo';
  static const login = '/login';
  static const account = '/account';
  static const home = '/home';
  static const test = '/test';
  static const mypage = '/mypage';
  static const leaderboard = '/mypage/leaderboard';
  static const mybadges = '/mypage/badge';
  static const myreport = '/mypage/report';
  static const quest = '/quest';
  static const questdetail = '/quest/detail';
  static const questcertification = '/quest/certification';
  static const questgallery = '/quest/gallery';
  static const questimage = '/quest/certification/image';
  static const questcertificationmodal = 'quest/certification/modal';
  static const mbti = '/mbti';

  // query_parameter keys for Route
  static const memberKey = "mid";
  static const questKey = "qid";
  static const memdoidKey = 'memdoid';

  static Route<dynamic> RouteGenerater(RouteSettings settings) {
    Uri uri = Uri.parse(settings.name ?? "");
    Map<String, dynamic> params = {};
    final heroController = HeroController();

    uri.queryParameters.forEach((key, value) {
      if (key != memberKey && key != questKey && key != memdoidKey) {
        throw ArgumentError("Router QueryKey is invalid");
      }

      params[key] = int.tryParse(value) ?? value;
    });

    return MaterialPageRoute(
        builder: (context) {
          switch (uri.path) {
            case logo:
              return const Logo();
            case start:
              if (params.isNotEmpty) {
                return const BottomNavigatorbar();
              }
              return Row(
                children: [
                  const Text("Error"),
                  ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("return"))
                ],
              );
            case tutorial:
              return const TutorialScreen();
            case mbti:
              return const MBTITestScreen();
            case login:
              return AuthLoginScreen();
            case account:
              return const AuthRegisterScreen();
            case quest:
              if (params.isNotEmpty) {
                return HeroControllerScope(
                    controller: heroController, child: QuestTabScreen());
              }
              return Row(
                children: [
                  const Text("Error"),
                  ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("return"))
                ],
              );
            case questdetail:
              if (params.isNotEmpty) {
                return HeroControllerScope(
                    controller: heroController, child: QuestDetailScreen());
              }
              return Row(
                children: [
                  const Text("Error"),
                  ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("return"))
                ],
              );

            case questimage:
              if (params.isNotEmpty) {
                return HeroControllerScope(
                    controller: heroController, child: QuestImageScreen());
              }
              return Row(
                children: [
                  const Text("Error"),
                  ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("return"))
                ],
              );

            case questgallery:
              if (params.isNotEmpty) {
                return HeroControllerScope(
                    controller: heroController, child: QuestGalleryScreen());
              }
              return Row(
                children: [
                  const Text("Error"),
                  ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("return"))
                ],
              );

            case questcertificationmodal:
              if (params.isNotEmpty) {
                return HeroControllerScope(
                    controller: heroController, child: CertificateModal());
              }
              return Row(
                children: [
                  const Text("Error"),
                  ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("return"))
                ],
              );
            case home:
              return const HomeScreen();
            default:
              return Row(
                children: [
                  const Text("Error"),
                  ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("return"))
                ],
              );
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
    mid = int.parse(map[Routes.memberKey] ?? '1');
  }
}

class questArguments {
  late final int qid;
  questArguments(Map<String, String> map) {
    qid = int.parse(map[Routes.questKey] ?? '1');
  }
}

class memDoIdArguments {
  late final int memdoid;
  memDoIdArguments(Map<String, String> map) {
    memdoid = int.parse(map[Routes.memdoidKey] ?? '1');
  }
}
