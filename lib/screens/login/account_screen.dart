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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Create Account',
                style: TextStyle(
                  fontFamily: 'Nunito',
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
                            FormInput('User name', 'Your username'),
                            SizedBox(height: 10),
                            FormInput('Email', 'EcoReward@GDSC.com'),
                            SizedBox(height: 10),
                            FormInput('Password',
                                'Password must be greater than 8 characters.'),
                            SizedBox(height: 10),
                            FormInput('Confirm Password', 'Confirm Password'),
                            SizedBox(height: 50),
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
