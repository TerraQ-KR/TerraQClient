import 'package:flutter/material.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';

class ButtonTutorial extends StatelessWidget {
  final onPressed;
  final String text;

  const ButtonTutorial({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.black),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.grey; // Change color when pressed
          } else if (states.contains(MaterialState.hovered)) {
            return Colors.grey; // Change color when hovered
          }
          return Colors.white;
        }),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 50, maxHeight: 50),
        child: Text(
          text,
          style: questTheme.textTheme.bodyMedium!.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}

// Future<void> navigateToCertification(context) async {
//   Navigator.pushNamed(context, Routes.questimage);
// }
