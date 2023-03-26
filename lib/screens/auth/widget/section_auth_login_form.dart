import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../utils/validate_auth_utils.dart';
import 'button_auth_common.dart';
import 'input_auth_common.dart';

class SectionAuthLoginForm extends StatefulHookWidget {
  const SectionAuthLoginForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SectionAuthLoginFormState createState() => _SectionAuthLoginFormState();
}

class _SectionAuthLoginFormState extends State<SectionAuthLoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final mutateLogin =
        cachedMutation(mutationKey: "LOGIN", apiType: "POST", path: '/login');

    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          InputAuthCommon(
            text: 'Email',
            hintMessage: 'Email',
            validator: (value) => ValidateAuthUtils().validateEmail(value),
            // ignore: prefer-extracting-callbacks
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          const SizedBox(height: 10),
          InputAuthCommon(
            text: 'Password',
            hintMessage: 'Password',
            validator: (value) => ValidateAuthUtils().validatePassword(value),
            // ignore: prefer-extracting-callbacks
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          const SizedBox(height: 25),
          ButtonAuthCommon(
            text: 'LOGIN',
            // ignore: prefer-extracting-callbacks
            onPressed: () async {
              try {
                mutateLogin.mutate({'email': email, 'password': password},
                    onData: ((payload, variables, context) => print(payload)));
              } catch (e) {
                print(e);
              }
            },
          )
        ]));
  }
}
