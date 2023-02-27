import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/utils/color_utils.dart';

class InputAuth extends StatelessWidget {
  final String text;
  final String hintMessage;
  final FormFieldValidator validator;
  final Function(String)? onChanged;
  const InputAuth(
      {required this.text,
      required this.hintMessage,
      required this.validator,
      this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        text,
        style: const TextStyle(
          fontFamily: FontUtils.primary,
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      TextFormField(
        validator: validator,
        onChanged: onChanged,
        obscureText:
            (text == 'Password' || text == 'Confirm Password') ? true : false,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtils.primary),
            borderRadius: BorderRadius.zero,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtils.primary),
            borderRadius: BorderRadius.zero,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtils.primary),
            borderRadius: BorderRadius.zero,
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtils.primary),
            borderRadius: BorderRadius.zero,
          ),
          hintText: hintMessage,
          hintStyle: const TextStyle(
            color: ColorUtils.grey01,
            fontSize: 14,
          ),
          fillColor: ColorUtils.white,
        ),
      ),
    ]);
  }
}
