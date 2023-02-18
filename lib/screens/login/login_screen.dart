import 'package:eco_reward_app/screens/login/widget/form_social_button.dart';
import 'package:flutter/material.dart';
import './widget/form_input.dart';
import './widget/form_button.dart';
import './widget/form_social_button.dart';

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
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.black,
                ),
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
                            FormInput('', 'Email'),
                            SizedBox(height: 20),
                            FormInput('', 'Password'),
                            Text(
                              'Incorrect email or password',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 11,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 42),
                            FormButton('Sign in'),
                            SizedBox(height: 11),
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 12,
                                color: Colors.blue,
                              ),
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
              Text("Don't have an account? Sign Up"),
            ],
          ),
        ],
      ),
    );
  }
}
