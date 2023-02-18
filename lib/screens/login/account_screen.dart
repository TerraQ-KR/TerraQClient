import 'package:flutter/material.dart';
import './widget/form_input.dart';
import './widget/form_button.dart';

class AccountPage extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //private variable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('Create Account'),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                          key: _formkey,
                          child: Column(children: <Widget>[
                            FormInput('User name', 'Your username'),
                            FormInput('Email', 'EcoReward@GDSC.com'),
                            FormInput('Password',
                                'Password must be greater than 8 characters.'),
                            FormInput('Confirm Password', 'Confirm Password'),
                            FormButton('Sign up'),
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
