import 'dart:async';
import 'dart:convert';

import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/auth/userInfo.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../utils/validate_auth_utils.dart';
import 'button_auth_common.dart';
import 'input_auth_common.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SectionAuthLoginForm extends StatefulHookWidget {
  const SectionAuthLoginForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SectionAuthLoginFormState createState() => _SectionAuthLoginFormState();
}

class _SectionAuthLoginFormState extends State<SectionAuthLoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const storage = FlutterSecureStorage();
  dynamic userInfo = '';

  String email = '';
  String password = '';
  bool errorEmail = false;
  bool errorPassword = false;
  bool loginSuccess = false;
  int memberId = -1;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    userInfo = await storage.read(key: 'login');

    if (userInfo != null) {
      var mid = jsonDecode(userInfo)["user_id"];

      Navigator.pushNamed(
          context,
          RouteParams(
              path: Routes.start, queryParameters: {Routes.memberKey: mid}));
    }
  }

  void validLogin() async {
    if (loginSuccess && !errorEmail && !errorPassword) {
      await storage.write(
          key: 'login',
          value: jsonEncode(
            Login(email, password, memberId.toString()),
          ));

      Navigator.pushNamed(
        context,
        RouteParams(
          path: Routes.start,
          queryParameters: {Routes.memberKey: memberId.toString()},
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mutateLogin =
        cachedMutation(mutationKey: "LOGIN", apiType: "POST", path: '/login');

    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        InputAuthCommon(
          text: 'Email',
          hintMessage: 'Email',
          validator: (value) => ValidateAuthUtils().validateEmail(value),
          // ignore: prefer-extracting-callbacks
          onChanged: (value) {
            setState(() {
              email = value;
            });
          },
        ),
        errorEmail
            ? const Text("There is no such email information.",
                style: TextStyle(color: ColorUtils.black))
            : Container(),
        const SizedBox(height: 10),
        InputAuthCommon(
          text: 'Password',
          hintMessage: 'Password',
          validator: (value) => ValidateAuthUtils().validatePassword(value),
          // ignore: prefer-extracting-callbacks
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
        ),
        errorPassword
            ? const Text("Invalid Password",
                style: TextStyle(color: ColorUtils.black))
            : Container(),
        const SizedBox(height: 25),
        ButtonAuthCommon(
          text: 'LOGIN',
          // ignore: prefer-extracting-callbacks
          onPressed: () async {
            print(email);
            print(password);

            mutateLogin.mutate(
              {'email': email, 'password': password},
              onData: (payload, variables, context) {
                var t = payload.toString();
                var first = t.split(",")[0].split("{")[1];

                var key1 = first.split(":")[0];
                var value1 = first.split(":")[1];

                if (key1 == "\"errorCode\"") {
                  setState(() {
                    loginSuccess = false;
                    errorEmail = value1 == "\"WRONG_EMAIL\"";
                    errorPassword = value1 == "\"WRONG_PASSWORD\"";
                  });
                } else if (key1 == "\"memberId\"") {
                  setState(() {
                    loginSuccess = true;
                    errorEmail = false;
                    errorPassword = false;
                    memberId = int.parse(value1);
                  });
                }

                validLogin();
              },
            );

            setState(() {
              loginSuccess = false;
            });
            Timer(
              const Duration(seconds: 3),
              () => setState(
                () {
                  errorEmail = false;
                  errorPassword = false;
                },
              ),
            );
          },
        ),
        TextButton(
          // ignore: prefer-extracting-callbacks
          onPressed: () => Navigator.pushNamed(
            context,
            RouteParams(path: Routes.account),
          ),
          child: Text(
            "Don't have an account? Sign Up",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ]),
    );
  }
}
