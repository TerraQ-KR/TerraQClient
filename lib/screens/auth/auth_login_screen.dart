import 'package:eco_reward_app/screens/auth/widget/section_auth_login_form.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/style/default_theme.dart';

class AuthLoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'EcoReward',
                  style: defaultTheme.textTheme.titleLarge,
                ),
                const SizedBox(height: 80),
                Stack(
                  children: <Widget>[SectionAuthLoginForm()],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Future<void> navigateToHomeScreen(BuildContext context) async {
//   Navigator.pushNamed(context, '/account');
// }
