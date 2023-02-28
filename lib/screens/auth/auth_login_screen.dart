import 'package:flutter/material.dart';
import 'package:eco_reward_app/style/default_theme.dart';
import 'package:eco_reward_app/screens/auth/widget/input_auth_common.dart';
import 'package:eco_reward_app/screens/auth/widget/button_auth_common.dart';
import 'package:eco_reward_app/screens/auth/widget/button_auth_social.dart';
import 'package:eco_reward_app/screens/auth/utils/validate_auth_utils.dart';

class AuthLoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthLoginScreen({super.key});

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
                style: defaultTheme.textTheme.titleLarge,
              ),
              const SizedBox(height: 80),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                          key: _formKey,
                          child: Column(children: <Widget>[
                            InputAuthCommon(
                              text: 'Email',
                              hintMessage: 'Email',
                              validator: (value) =>
                                  ValidateAuthUtils().validateEmail(value),
                            ),
                            const SizedBox(height: 10),
                            InputAuthCommon(
                              text: 'Password',
                              hintMessage: 'Password',
                              validator: (value) =>
                                  ValidateAuthUtils().validatePassword(value),
                            ),
                            const SizedBox(height: 20),
                            ButtonAuth(
                              text: 'LOGIN',
                              onPressed: () =>
                                  validateAndNavigate(context, _formKey),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Forgot Password?",
                            ),
                            const SizedBox(height: 40),
                            const ButtonAuthSocial('Google'),
                            const SizedBox(height: 10),
                            const ButtonAuthSocial('Facebook'),
                          ])),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => navigateToHomeScreen(context),
                child: Text(
                  "Don't have an account? Sign Up",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              TextButton(
                onPressed: () => validateAndNavigate(context, _formKey),
                child: Text(
                  "TEMP MOVE HOME",
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
    Navigator.pushNamed(context, '/home');
  }
}

Future<void> navigateToHomeScreen(BuildContext context) async {
  Navigator.pushNamed(context, '/account');
}
