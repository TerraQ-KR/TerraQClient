import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/auth/auth_login_screen.dart';
import 'package:eco_reward_app/screens/home/class/t_category.dart';
import 'package:eco_reward_app/utils/font_utils.dart';

class BoxHomeCategory extends StatelessWidget {
  final TCategory category;

  const BoxHomeCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleTap(context),
      child: Card(
        elevation: 0,
        color: category.color?.withAlpha(200),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Center(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                category.label,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: FontUtils.primary,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleTap(BuildContext context) async {
    // ignore: unused_local_variable
    final action = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AuthLoginScreen(),
      ),
    );
    // do something with the result if needed
  }
}
