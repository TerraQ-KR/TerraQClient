// ignore_for_file: unused_import,non_constant_identifier_names

import 'package:eco_reward_app/network/provider/test_screen.dart';
import 'package:flutter/material.dart';

import 'package:eco_reward_app/screens/auth/auth_register_screen.dart';
import 'package:eco_reward_app/screens/auth/auth_login_screen.dart';
import 'package:eco_reward_app/screens/home/home_screen.dart';
import 'package:eco_reward_app/screens/profile/profile_screen.dart';

class Routes {
  static const login = '/login';
  static const account = '/account';
  static const home = '/home';
  static const test = '/test';

  // query_parameter keys for Route
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
            case login:
              return AuthLoginScreen();
            case account:
              return AuthRegisterScreen();
            case home:
              return const HomeScreen();
            case test:
              if (params.isNotEmpty) {
                return const testOtherScreen();
              }
              return const TestWidget();
            default:
              return const Text("Error");
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
