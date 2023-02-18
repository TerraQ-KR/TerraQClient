import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String text;
  final String hintMessage;
  const FormInput(this.text, this.hintMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        text,
        style: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      TextFormField(
        onSaved: (value) {},
        validator: (value) {
          if (value!.isEmpty) {
            print('Please enter your $text');
          }
          return null;
        },
        obscureText: text == 'Password' ? true : false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.zero,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.zero,
          ),
          hintText: hintMessage,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          fillColor: Colors.white,
        ),
      ),
    ]);
  }
}
