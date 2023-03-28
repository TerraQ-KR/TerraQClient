import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/auth/auth_login_screen.dart';
import 'package:eco_reward_app/screens/home/type/t_category.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:flutter_svg/svg.dart';

class BoxHomeCategory extends StatelessWidget {
  final TCategory category;

  const BoxHomeCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(category.icon);

    return GestureDetector(
      onTap: () => handleTap(context),
      child: Card(
        elevation: 0,
        color: ColorUtils.grey03,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: SvgPicture.network(
                    category.icon,
                  ),
                ),
              ),
            ),
            Center(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    category.label,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: FontUtils.primary,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
