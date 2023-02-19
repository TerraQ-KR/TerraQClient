import 'package:eco_reward_app/screens/login/widget/form_social_button.dart';
import 'package:flutter/material.dart';
import './widget/form_input.dart';
import './widget/form_button.dart';
import './widget/form_social_button.dart';
import 'package:eco_reward_app/style/default_theme.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
              SizedBox(height: 80),
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
                              text: '',
                              hintMessage: 'Email',
                              validator: (value) => value!.isEmpty
                                  ? 'Email cannot be empty.'
                                  : null,
                            ),
                            SizedBox(height: 20),
                            FormInput(
                              text: '',
                              hintMessage: 'Password',
                              validator: (value) => value!.isEmpty
                                  ? 'Password cannot be empty.'
                                  : null,
                            ),
                            Text(
                              'Incorrect email or password',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            SizedBox(height: 42),
                            FormButton(
                              text: 'Sign in',
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  print('Success');
                                }
                              },
                            ),
                            SizedBox(height: 11),
                            Text(
                              "Forgot Password?",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            SizedBox(height: 47),
                            SocialButton('Kakao'),
                            SizedBox(height: 25),
                            SocialButton('Google'),
                          ])),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                child: Text(
                  "Don't have an account? Sign Up",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/account');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
