import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  const FormButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print(text);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        minimumSize: const Size.fromHeight(50),
        elevation: 0.0,
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
