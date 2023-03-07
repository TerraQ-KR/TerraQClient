class TQuest {
  final int? id;
  final String? questName;
  final int? questID;
  final Map<String, dynamic>? categoryDto;
  final int? reward;
  final String? memo;
  final int? timeLimit;
  final int? nowChallenger;

  TQuest({
    required this.id,
    required this.questName,
    required this.questID,
    required this.categoryDto,
    required this.reward,
    required this.memo,
    required this.timeLimit,
    required this.nowChallenger,
  });
}
