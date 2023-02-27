import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';

class QuestToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () => navigateToStatus(context),
          icon: const Icon(Icons.all_inbox, color: ColorUtils.black, size: 20),
          label: const Text(
            'Status',
            style: TextStyle(
              color: ColorUtils.black,
              fontSize: 18,
              fontFamily: FontUtils.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtils.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        const SizedBox(width: 100),
        FloatingActionButton.small(
          backgroundColor: ColorUtils.white,
          onPressed: () => {},
          child: const Icon(Icons.search, color: ColorUtils.black, size: 20),
        ),
        FloatingActionButton.small(
          backgroundColor: ColorUtils.white,
          onPressed: () => {},
          child: const Icon(Icons.sort, color: ColorUtils.black, size: 20),
        ),
        FloatingActionButton.small(
          backgroundColor: ColorUtils.white,
          onPressed: () => {},
          child: const Icon(Icons.alarm, color: Colors.black, size: 20),
        ),
      ],
    );
  }
}

Future<void> navigateToStatus(context) async {
  Navigator.pushNamed(context, '/quest/status');
}
