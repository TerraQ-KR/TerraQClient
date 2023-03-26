// ignore_for_file: unused_import,non_constant_identifier_names

import 'package:eco_reward_app/network/provider/test_screen.dart';
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
import 'package:eco_reward_app/screens/quest/certification/quest_certification_screen.dart';
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

  static Route<dynamic> RouteGenerater(RouteSettings settings) {
    Uri uri = Uri.parse(settings.name ?? "");
    Map<String, dynamic> params = {};
    final Object? args = settings.arguments;
    uri.queryParameters.forEach((key, value) {
      if (key != memberKey) {
        throw ArgumentError("Router QueryKey is invalid");
      }
      params[key] = int.tryParse(value) ?? value;
    });

    return MaterialPageRoute(
        builder: (context) {
          switch (uri.path) {
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
              return AuthRegisterScreen();
            case quest:
              if (params.isNotEmpty) {
                return const QuestTabScreen();
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
              final QuestDetailScreen detailArgs = args as QuestDetailScreen;
              return QuestDetailScreen(
                qid: detailArgs.qid,
              );

            case questcertification:
              final QuestCertificationScreen certArgs =
                  args as QuestCertificationScreen;
              return QuestCertificationScreen(
                image: certArgs.image,
              );

            case questimage:
              final QuestImageScreen imageArgs = args as QuestImageScreen;
              return QuestImageScreen(
                questName: imageArgs.questName,
                reward: imageArgs.reward,
              );

            case questgallery:
              if (params.isNotEmpty) {
                return const QuestGalleryScreen();
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
              final CertificateModal modalArgs = args as CertificateModal;
              return CertificateModal(
                questName: modalArgs.questName,
                reward: modalArgs.reward,
                information: modalArgs.information,
              );
            case home:
              return const HomeScreen();
            // case home:
            //   return const HomeScreen();
            // case test:
            //   if (params.isNotEmpty) {
            //     return const testOtherScreen();
            //   }
            //   return TestWidget();
            case test:
              if (params.isNotEmpty) {
                return const testOtherScreen();
              }
              return TestWidget();
            case mypage:
              if (params.isNotEmpty) {
                return const ProfileScreen();
              }
              return Row(
                children: [
                  const Text("Error"),
                  ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("return"))
                ],
              );
            case leaderboard:
              if (params.isNotEmpty) {
                return const LeaderBoard();
              }
              return Row(
                children: [
                  const Text("Error"),
                  ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("return"))
                ],
              );
            case mybadges:
              if (params.isNotEmpty) {
                return const MyBadges();
              }
              return Row(
                children: [
                  const Text("Error"),
                  ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("return"))
                ],
              );
            case myreport:
              if (params.isNotEmpty) {
                return const MyReport();
              }
              return Row(
                children: [
                  const Text("Error"),
                  ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("return"))
                ],
              );
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
