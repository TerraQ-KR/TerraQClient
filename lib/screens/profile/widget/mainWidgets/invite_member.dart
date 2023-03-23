import 'package:eco_reward_app/screens/profile/components/personalComponents.dart';
import 'package:eco_reward_app/screens/profile/constants/profile_icons.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InviteMember extends StatefulWidget {
  const InviteMember({
    super.key,
  });

  @override
  State<InviteMember> createState() => _InviteMemberState();
}

class _InviteMemberState extends State<InviteMember> {
  void InviteDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelWidth = deviceSize.width;
    double pixelHeight = deviceSize.height;

    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: ColorUtils.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            Flexible(
              flex: 1,
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorUtils.white,
                    foregroundColor: ColorUtils.black,
                    elevation: 0,
                  ),
                  // ignore: prefer-extracting-callbacks
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: "clip board"));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            ProfileIcons.addGroup,
                            size: 0.04 * pixelHeight,
                            color: ColorUtils.black,
                          ),
                          SizedBox(
                            width: 0.04 * pixelWidth,
                          ),
                          Text(
                            "Invite",
                            style: TextStyle(
                                fontSize: 0.025 * pixelHeight,
                                fontWeight: FontWeight.w900,
                                fontFamily: FontUtils.primary,
                                color: ColorUtils.black),
                          )
                        ],
                      ),
                      Icon(Icons.copy,
                          size: 0.03 * pixelHeight, color: ColorUtils.grey05)
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              color: ColorUtils.grey05,
              height: 1.3,
            ),
            const Flexible(
              flex: 1,
              child: PersonalComponent(
                navigatePath: "login",
                componentIcon: ProfileIcons.phone,
                componentText: "Inquiry",
              ),
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}
