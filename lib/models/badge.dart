class Badge {
  String badgeTitle;
  String link;

  Badge({ required this.badgeTitle, required this.link });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      badgeTitle: json['name'],
      link: json['link']  
    );
  }

  static List<Badge> fromJsonList(List<dynamic> jsonList) {
    List<Badge> badgeList = [];

    for(var json in jsonList) {
      badgeList.add(Badge.fromJson(json));
    }

    return badgeList;
  }
}