import 't_quest.dart';

List<TQuest> getQuestDetail(dataSource) {
  if (dataSource == null) {
    return [];
  }

  return (dataSource as List<dynamic>).map<TQuest>((dynamic item) {
    return TQuest(
      id: item['id'],
      questName: item['questName'],
      questID: item['questID'],
      categoryDto: item['categoryDto'],
      reward: item['reward'],
      briefing: item['briefing'],
      information: item['information'],
      timeLimit: item['timeLimit'],
      challenger: item['challenger'],
    );
  }).toList();
}
