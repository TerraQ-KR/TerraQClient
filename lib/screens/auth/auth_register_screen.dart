import 'package:flutter/material.dart';

import 'package:eco_reward_app/screens/auth/widget/input_auth_common.dart';
import 'package:eco_reward_app/screens/auth/widget/button_auth_common.dart';
import 'package:eco_reward_app/screens/auth/utils/validate_auth_utils.dart';

class AuthRegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //private variable
  AuthRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String password = '';

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                          child: Column(children: <Widget>[
                            InputAuthCommon(
                              text: 'User name',
                              hintMessage: 'Your username',
                              validator: (value) =>
                                  ValidateAuthUtils().validateName(value),
                            ),
                            const SizedBox(height: 10),
                            InputAuthCommon(
                              text: 'Email',
                              hintMessage: 'EcoReward@GDSC.com',
                              validator: (value) =>
                                  ValidateAuthUtils().validateEmail(value),
                            ),
                            const SizedBox(height: 10),
                            InputAuthCommon(
                              text: 'Password',
                              hintMessage:
                                  'Password must be greater than 8 characters.',
                              validator: (value) =>
                                  ValidateAuthUtils().validatePassword(value),
                              onChanged: (value) => password = value,
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
                              onPressed: () => handleClick(context),
                            ),
                          ])),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }

  void handleClick(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
    }
  }
}
