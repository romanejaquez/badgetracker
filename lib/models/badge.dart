import 'package:badgetracker/utils/utils.dart';

class Badge {
  String badgeTitle;
  String link;
  bool isComplete;

  Badge({ required this.badgeTitle, required this.link, required this.isComplete });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      badgeTitle: json['name'],
      link: json['link'],
      isComplete: Utils.checkForSessionCompletion(json['name'])
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