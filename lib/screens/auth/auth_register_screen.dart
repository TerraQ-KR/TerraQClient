import 'package:flutter/material.dart';

import 'package:eco_reward_app/screens/auth/widget/input_auth_common.dart';
import 'package:eco_reward_app/screens/auth/widget/button_auth_common.dart';
import 'package:eco_reward_app/screens/auth/utils/validation_auth_utils.dart';

class AuthRegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //private variable
  String password = '';
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
              // ignore: prefer_const_constructors
              Text(
                'Create Account',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
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
                              text: 'User name',
                              hintMessage: 'Your username',
                              validator: (value) =>
                                  ValidateUtils().validateName(value),
                            ),
                            const SizedBox(height: 10),
                            InputAuth(
                              text: 'Email',
                              hintMessage: 'EcoReward@GDSC.com',
                              validator: (value) =>
                                  ValidateUtils().validateEmail(value),
                            ),
                            const SizedBox(height: 10),
                            InputAuth(
                              text: 'Password',
                              hintMessage:
                                  'Password must be greater than 8 characters.',
                              validator: (value) =>
                                  ValidateUtils().validatePassword(value),
                              onChanged: (value) => password = value,
                            ),
                            const SizedBox(height: 10),
                            InputAuth(
                              text: 'Confirm Password',
                              hintMessage: 'Confirm Password',
                              validator: (value) => ValidateUtils()
                                  .validateConfirmPassword(value, password),
                            ),
                            const SizedBox(height: 50),
                            ButtonAuth(
                              text: 'Sign up',
                              onPressed: () => validateAndSave(_formKey),
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
}

Future<void> validateAndSave(key) async {
  final FormState? form = key.currentState;
  if (form!.validate()) {
    print('Form is valid');
  }
}
