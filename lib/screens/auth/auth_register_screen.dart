import 'dart:async';
import 'dart:convert';

import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/model/member_profile.dart';
import 'package:flutter/material.dart';

import 'package:eco_reward_app/screens/auth/widget/input_auth_common.dart';
import 'package:eco_reward_app/screens/auth/widget/button_auth_common.dart';
import 'package:eco_reward_app/screens/auth/utils/validate_auth_utils.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthRegisterScreen extends StatefulHookWidget {
  const AuthRegisterScreen({super.key});

  @override
  State<AuthRegisterScreen> createState() => _AuthRegisterScreenState();
}

class _AuthRegisterScreenState extends State<AuthRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final redundentEmail = "This Email already been registered";
  bool redundentAccount = false;
  String email = '';
  String nickname = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelHeight = deviceSize.height;
    final mutateRegister = cachedMutation(
      mutationKey: "REGISTER",
      apiType: "POST",
      path: ApiPaths.createMember,
    );

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 0.1 * pixelHeight,
                ),
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              InputAuthCommon(
                                text: 'User name',
                                hintMessage: 'Your username',
                                validator: (value) =>
                                    ValidateAuthUtils().validateName(value),
                                onChanged: (value) => {
                                  setState(() {
                                    nickname = value;
                                  })
                                },
                              ),
                              const SizedBox(height: 10),
                              InputAuthCommon(
                                text: 'Email',
                                hintMessage: 'EcoReward@GDSC.com',
                                validator: (value) =>
                                    ValidateAuthUtils().validateEmail(value),
                                onChanged: (value) => {
                                  setState(() {
                                    email = value;
                                  })
                                },
                              ),
                              redundentAccount
                                  ? Text(
                                      redundentEmail,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    )
                                  : Container(),
                              const SizedBox(height: 10),
                              InputAuthCommon(
                                text: 'Password',
                                hintMessage:
                                    'Password must be greater than 8 characters.',
                                validator: (value) =>
                                    ValidateAuthUtils().validatePassword(value),
                                onChanged: (value) => {
                                  setState(() {
                                    password = value;
                                  })
                                },
                              ),
                              const SizedBox(height: 10),
                              InputAuthCommon(
                                text: 'Confirm Password',
                                hintMessage: 'Confirm Password',
                                validator: (value) => ValidateAuthUtils()
                                    .validateConfirmPassword(value, password),
                              ),
                              const SizedBox(height: 50),
                              ButtonAuthCommon(
                                text: 'Sign up',
                                // ignore: prefer-extracting-callbacks
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final v = await mutateRegister.mutateAsync({
                                      "nickname": nickname,
                                      "title": null,
                                      "email": email,
                                      "password": password
                                    });

                                    final response = json.decode(v.toString())
                                        as Map<String, dynamic>;

                                    if (response["errorCode"] ==
                                        "ALREADY_REGISTERED") {
                                      setState(() {
                                        redundentAccount = true;
                                      });
                                    } else {
                                      MemberProfile profile =
                                          memberProfile(response);
                                      Navigator.pushNamed(
                                          context,
                                          RouteParams(
                                              path: Routes.mypage,
                                              queryParameters: {
                                                Routes.memberKey:
                                                    profile.memberid.toString()
                                              }));
                                    }
                                  }

                                  Timer(
                                      const Duration(seconds: 3),
                                      () => setState(
                                            () {
                                              redundentAccount = false;
                                            },
                                          ));
                                },
                              ),
                              TextButton(
                                // ignore: prefer-extracting-callbacks
                                onPressed: () => Navigator.pushNamed(
                                  context,
                                  RouteParams(path: Routes.login),
                                ),
                                child: Text(
                                  "Already have account? Sign In",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> validateAndSave(key) async {
  final FormState? form = key.currentState;
  if (form!.validate()) {
    print('Form is valid');
  }
}
