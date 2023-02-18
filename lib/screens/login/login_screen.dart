import 'package:flutter/material.dart';
import './widget/form_input.dart';
import './widget/form_button.dart';

class LoginPage extends StatelessWidget {
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
              Text('EcoReward'),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                          key: _formkey,
                          child: Column(children: <Widget>[
                            FormInput('Email', 'Email'),
                            FormInput('Password', 'Password'),
                            FormButton('Sign in'),
                            Text("Forgot Password?"),
                          ])),
                    ),
                  ),
                ],
              ),
              Text("Don't have an account? Sign Up"),
              Container(
                height: 48,
              )
            ],
          ),
        ],
      ),
    );
  }
}
