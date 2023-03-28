class APIHome {
  static String homeCategoryAPI(int memberId) {
    return '/getMemberCategory/$memberId';
  }

  static String homeQuestAPI(int memberId) {
    return '/getMemberQuest/$memberId';
  }

  static String homeRewardAPI(int memberId) {
    return '/getMemberCategory/$memberId';
  }
}
