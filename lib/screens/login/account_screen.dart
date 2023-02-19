import 'package:flutter/material.dart';
import './widget/form_input.dart';
import './widget/form_button.dart';

import 'package:eco_reward_app/utils/font_utils.dart';

class AccountPage extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String password = '';
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
                'Create Account',
                style: TextStyle(
                  fontFamily: FontUtils.primary,
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
                          key: _formkey,
                          child: Column(children: <Widget>[
                            FormInput(
                              text: 'User name',
                              hintMessage: 'Your username',
                              validator: (value) => value!.isEmpty
                                  ? 'That username is taken. Try another.'
                                  : null,
                            ),
                            SizedBox(height: 10),
                            FormInput(
                              text: 'Email',
                              hintMessage: 'EcoReward@GDSC.com',
                              validator: (value) => value!.isEmpty
                                  ? 'Email cannot be empty.'
                                  : null,
                            ),
                            SizedBox(height: 10),
                            FormInput(
                              text: 'Password',
                              hintMessage:
                                  'Password must be greater than 8 characters.',
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Password cannot be empty.';
                                } else if (!RegExp(
                                        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,}$')
                                    .hasMatch(value)) {
                                  return 'Password must be greater than 8 characters.';
                                }
                                password = value;
                              },
                            ),
                            SizedBox(height: 10),
                            FormInput(
                              text: 'Confirm Password',
                              hintMessage: 'Confirm Password',
                              validator: (value) {
                                if (value! == password) {
                                  return null;
                                }
                                return 'Password does not match.';
                              },
                            ),
                            SizedBox(height: 50),
                            FormButton(
                              text: 'Sign up',
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  Navigator.pop(context);
                                }
                              },
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
