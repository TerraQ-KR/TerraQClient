import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import '../../../style/default_theme.dart';

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
            color: Colors.black,
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
                borderSide: BorderSide(color: ColorUtils.primary),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorUtils.primary),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 72, 90, 73)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorUtils.primary),
              ),
              hintText: hintMessage,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              fillColor: Colors.white,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
      ],
    );
  }
}
