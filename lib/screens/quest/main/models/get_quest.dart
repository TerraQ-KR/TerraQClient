import 't_quest.dart';

List<TQuest> getQuestNotMyQuestList(dataSource) {
  if (dataSource == null) {
    return [];
  }

  return (dataSource as List<dynamic>).map<TQuest>((dynamic item) {
    return TQuest(
      id: item['id'] ?? 0,
      questName: item['questName'] ?? '',
      questId: item['questId'] ?? 0,
      subCategroyName: item['categoryDto']['subCategoryName'] ?? 'sub',
      reward: item['reward'] ?? 0,
      briefing: item['briefing'] ?? 'null',
      timeLimit: item['timeLimit'] ?? 0,
      nowChallenger: item['nowChallenger'] ?? 0,
    );
  }).toList();
}
