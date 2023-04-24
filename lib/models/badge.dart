
class BadgeModel {
  String badgeTitle;
  String link;
  bool isComplete;
  String? earned;

  BadgeModel({ required this.badgeTitle, required this.link, required this.isComplete, this.earned = '' });

  factory BadgeModel.fromJson(Map<String, dynamic> json) {
    return BadgeModel(
      badgeTitle: json['badgeTitle'],
      link: json['link'],
      isComplete: false,
      earned: json['earned'] ?? ''
    );
  }

  static List<BadgeModel> fromJsonList(List<dynamic> jsonList) {
    List<BadgeModel> badgeList = [];

    for(var json in jsonList) {
      badgeList.add(BadgeModel.fromJson(json));
    }

    return badgeList;
  }
}