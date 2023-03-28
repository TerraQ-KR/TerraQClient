import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/network/provider/api_path.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/screens/quest/detail/model/get_detail.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/button_quest_detail.dart';

class CertificateModal extends HookWidget {
  const CertificateModal({super.key});

  @override
  Widget build(BuildContext context) {
    var mid = Arguments(QueryParams(context)).mid;
    var qid = questArguments(QueryParams(context)).qid;

    final quest = cachedQuery(
        queryKey: QueryKeys().myQuestDetailView(qid),
        path: ApiPaths().myQuestDetailView(qid));

    getDetail questData = getdetail(quest.data);

    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: IconButton(
                  onPressed: () => _navigateToBefore(context),
                  icon: const Icon(Icons.close,
                      color: ColorUtils.black, size: 30)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                'Certification Regulations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorUtils.black,
                  fontSize: 18,
                  fontFamily: FontUtils.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Text(questData.information,
                  style: const TextStyle(
                    color: ColorUtils.black,
                    fontSize: 14,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonQuestDetail(
                text: 'Confirm',
                onPressed: () => _navigateToImage(context, mid, qid),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_navigateToImage(context, mid, qid) async {
  return Navigator.pushNamed(
      context,
      RouteParams(
          path: Routes.questimage,
          queryParameters: {'mid': mid.toString(), 'qid': qid.toString()}));
}

_navigateToBefore(context) async {
  return Navigator.pop(context);
}
