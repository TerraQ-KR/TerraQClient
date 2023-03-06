import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/style/default_theme.dart';

class InputAuthCommon extends StatelessWidget {
  final String text;
  final String hintMessage;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  const InputAuthCommon({
    required this.text,
    required this.hintMessage,
    required this.validator,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontFamily: FontUtils.primary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorUtils.black,
          ),
        ),
        const SizedBox(height: 4),
        Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: defaultTheme.inputDecorationTheme,
          ),
          child: TextFormField(
            validator: validator,
            onChanged: onChanged,
            obscureText: (text == 'Password' || text == 'Confirm Password'),
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: ColorUtils.primary),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: ColorUtils.subBlue),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: ColorUtils.error),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: ColorUtils.error),
              ),
              hintText: hintMessage,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
