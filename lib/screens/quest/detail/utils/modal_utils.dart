import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/button_quest_detail.dart';

class ModalUtils extends StatefulWidget {
  const ModalUtils({super.key});

  @override
  State<ModalUtils> createState() => _ModalUtils();
}

enum SortType { date, category }

class _ModalUtils extends State<ModalUtils> {
  SortType _sortType = SortType.date;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: ColorUtils.white,
      onPressed: () {
        sortMyQuest(context);
      },
      child: const Icon(Icons.sort, color: ColorUtils.black, size: 20),
    );
  }

  // ignore: strict_raw_type
  Future sortMyQuest(context) async {
    showModalBottomSheet<void>(
      context: context,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'Please select the sort order.',
                    style: TextStyle(
                      color: ColorUtils.black,
                      fontSize: 18,
                      fontFamily: FontUtils.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                RadioListTile(
                  title: const Text('Sort by Date'),
                  value: SortType.date,
                  groupValue: _sortType,
                  // ignore: prefer-extracting-callbacks
                  onChanged: (SortType? value) {
                    setState(() {
                      _sortType = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Sort by Category'),
                  value: SortType.category,
                  groupValue: _sortType,
                  // ignore: prefer-extracting-callbacks
                  onChanged: (SortType? value) {
                    setState(() {
                      _sortType = value!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ButtonQuestDetail(
                    text: 'Confirm',
                    // ignore: prefer-extracting-callbacks
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
