import 'package:flutter/material.dart';
import '../utils/validate_auth_utils.dart';
import 'button_auth_common.dart';
import 'input_auth_common.dart';

class SectionAuthLoginForm extends StatefulWidget {
  const SectionAuthLoginForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SectionAuthLoginFormState createState() => _SectionAuthLoginFormState();
}

class _SectionAuthLoginFormState extends State<SectionAuthLoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
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
                _email = value;
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
                _password = value;
              });
            },
          ),
          const SizedBox(height: 25),
          ButtonAuthCommon(
            text: 'LOGIN',
            onPressed: () => validateAndNavigate(context, _formKey),
          )
        ]));
  }
}

Future<void> validateAndNavigate(BuildContext context, key) async {
  final FormState? form = key.currentState;
  if (form!.validate()) {
    Navigator.pushNamed(context, '/home');
  }
}
