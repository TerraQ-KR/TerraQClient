import 't_quest.dart';

List<TQuest> getQuestNotMyQuestList(dataSource) {
  if (dataSource == null) {
    return [];
  }

  return (dataSource as List<dynamic>).map<TQuest>((dynamic item) {
    return TQuest(
      id: item['id'] ?? 0,
      questName: item['questName'] ?? '',
      questID: item['questID'] ?? 0,
      categoryDto: item['categoryDto'] ?? {},
      reward: item['reward'] ?? 0,
      memo: item['memo'] ?? 'null',
      timeLimit: item['timeLimit'] ?? 0,
      nowChallenger: item['nowChallenger'] ?? 0,
    );
  }).toList();
}