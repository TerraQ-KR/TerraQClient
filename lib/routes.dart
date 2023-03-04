// ignore_for_file: unused_import

import 'package:eco_reward_app/network/provider/test_screen.dart';
import 'package:flutter/material.dart';

import 'package:eco_reward_app/screens/auth/auth_register_screen.dart';
import 'package:eco_reward_app/screens/auth/auth_login_screen.dart';
import 'package:eco_reward_app/screens/home/home_screen.dart';
import 'package:eco_reward_app/screens/profile/profile_screen.dart';

final routes = {
  '/': (BuildContext context) => const ProfileScreen(),
  // '/login': (BuildContext context) => AuthLoginScreen(),
  // '/account': (BuildContext context) => AuthRegisterScreen(),
  // '/home': (BuildContext context) => const HomeScreen(),
  '/mypage': (BuildContext context) => const ProfileScreen(),
};
