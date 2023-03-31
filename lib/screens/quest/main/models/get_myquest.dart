import 't_my_quest.dart';

List<TMyQuest> getMyQuest(dataSource) {
  if (dataSource == null) {
    return [];
  }

  return (dataSource as List<dynamic>?)?.map<TMyQuest>((dynamic item) {
        return TMyQuest(
          memDoId: item['memDoId'] ?? 0,
          questName: item['questDto']['questName'] ?? 'questName',
          questId: item['questDto']['questId'] ?? 0,
          subCategoryName: item['questDto']['categoryDto']['subCategoryName'] ??
              'subCategoryName',
          reward: item['questDto']['reward'] ?? 0,
          briefing: item['questDto']['briefing'] ?? 'null',
          timeLimit: item['questDto']['timeLimit'] ?? 0,
          challenger: item['questDto']['challenger'] ?? 0,
          startDate: item['startDate'] ?? 'null',
          dueDate: item['dueDate'] ?? 'null',
          // leftTime: item['leftTime'] ?? 0,
          // stance: item['stance'] ?? 0,
          // achieveRate: item['achieveRate'] ?? 0,
        );
      }).toList() ??
      [];
}
