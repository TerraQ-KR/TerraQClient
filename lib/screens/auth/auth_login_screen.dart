import 'package:flutter/material.dart';

import 'package:eco_reward_app/screens/auth/widget/input_auth_common.dart';
import 'package:eco_reward_app/screens/auth/widget/button_auth_common.dart';
import 'package:eco_reward_app/screens/auth/widget/button_auth_social.dart';
import 'package:eco_reward_app/screens/auth/utils/validation_auth_utils.dart';

class AuthLoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //private variable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'EcoReward',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 80),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                          key: _formKey,
                          child: Column(children: <Widget>[
                            InputAuth(
                              text: 'Email',
                              hintMessage: 'Email',
                              validator: (value) =>
                                  ValidateUtils().validateEmail(value),
                            ),
                            const SizedBox(height: 20),
                            InputAuth(
                              text: 'Password',
                              hintMessage: 'Password',
                              validator: (value) =>
                                  ValidateUtils().validatePassword(value),
                            ),
                            Text(
                              'Incorrect email or password',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 42),
                            ButtonAuth(
                              text: 'Sign in',
                              // ignore: prefer-extracting-callbacks
                              onPressed: () =>
                                  validateAndNavigate(context, _formKey),
                            ),
                            const SizedBox(height: 11),
                            Text(
                              "Forgot Password?",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 47),
                            const ButtonAuthSocial('Kakao'),
                            const SizedBox(height: 25),
                            const ButtonAuthSocial('Google'),
                          ])),
                    ),
                  ),
                ],
              ),
              TextButton(
                // ignore: prefer-extracting-callbacks
                onPressed: () => navigateToHomeScreen(context),
                child: Text(
                  "Don't have an account? Sign Up",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> validateAndNavigate(BuildContext context, key) async {
  final FormState? form = key.currentState;
  if (form!.validate()) {
    Navigator.pushNamed(context, '/quest');
  }
}

Future<void> navigateToHomeScreen(BuildContext context) async {
  Navigator.pushNamed(context, '/account');
}
