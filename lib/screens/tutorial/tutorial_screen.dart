import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/style/default_theme.dart';
import 'package:eco_reward_app/screens/tutorial/widget/button_tutorial.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';

class TutorialScreen extends StatefulHookWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  late int selectedNumber = 0;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelHeight = deviceSize.height;
    double pixelWidth = deviceSize.width;

    var mid = Arguments(QueryParams(context)).mid;

    final titleMutation = cachedMutation(
      mutationKey: 'createTitle',
      apiType: 'POST',
      path: ApiPaths.createTitle(mid),
    );

    var profileQuery = cachedQuery(
      queryKey: QueryKeys.memberdetail(mid),
      path: ApiPaths.memberdetail(mid),
    );

    void _showDialog(context, mid, index) => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Do you want to select this mbti?",
                  style: defaultTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  // ignore: prefer-extracting-callbacks
                  onPressed: () {
                    print('index : $index');
                    try {
                      titleMutation.mutate(index,
                          onData: (payload, variables, context) {
                        print('payload: $payload, index : $index');
                        profileQuery.refetch();
                      });
                    } catch (e) {
                      print(e);
                    }

                    navigateToStart(context, mid);
                  },
                ),
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorUtils.primary, ColorUtils.subBlue],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: pixelHeight * 0.1),
                child: Text('Tutorial Screen',
                    style: defaultTheme.textTheme.titleLarge!
                        .copyWith(fontSize: 20)),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: pixelHeight * 0.15),
                child: Text('Choose your MBTI',
                    style: defaultTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(top: pixelHeight * 0.2),
                child: GridView.count(
                  padding: EdgeInsets.fromLTRB(
                      pixelWidth * 0.1, 0, pixelWidth * 0.1, 0),
                  crossAxisSpacing: pixelWidth * 0.05,
                  mainAxisSpacing: pixelHeight * 0.02,
                  crossAxisCount: 3,
                  // ignore: prefer-extracting-callbacks
                  children: List.generate(
                    12,
                    (index) => SizedBox(
                      width: pixelWidth * 0.25,
                      height: pixelHeight * 0.02,
                      child: ButtonTutorial(
                        text: mbtiList[index],
                        isSelected: index == selectedNumber,
                        // ignore: prefer-extracting-callbacks
                        onPressed: () {
                          setState(() {
                            selectedNumber = index;
                            _showDialog(context, mid, selectedNumber + 1);
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

navigateToStart(context, mid) => Navigator.pushNamed(
    context,
    RouteParams(
        path: Routes.start,
        queryParameters: {Routes.memberKey: mid.toString()}));

List<String> mbtiList = [
  'ISTJ',
  'ISFJ',
  'INFJ',
  'INTJ',
  'ISTP',
  'ISFP',
  'INFP',
  'INTP',
  'ESTP',
  'ESFP',
  'ENFP',
  'ENTP',
  'ESTJ',
  'ESFJ',
  'ENFJ',
  'ENTJ',
];
