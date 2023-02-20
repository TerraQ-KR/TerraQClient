import 'package:flutter/material.dart';

class ButtonAuthSocial extends StatelessWidget {
  final String text;
  const ButtonAuthSocial(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print(text);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        minimumSize: const Size.fromHeight(40),
        elevation: 0.0,
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          'Continue with $text',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
