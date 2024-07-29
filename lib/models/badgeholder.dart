import 'package:badgetracker/models/badge.dart';

class BadgeHolder {

  String name;
  String imgUrl;
  List<BadgeModel> badges;
  String memberSince;
  int score;
  String profileLink;

  BadgeHolder({
    required this.name,
    required this.imgUrl,
    required this.badges,
    required this.memberSince,
    required this.profileLink,
    this.score = 0,
  });

  factory BadgeHolder.fromJson(Map<String, dynamic> json) {
    return BadgeHolder(
      name: json['profile']['name'], 
      imgUrl: json['profile']['avatar'],
      profileLink: json['profile']['profile_link'],
      badges: BadgeModel.fromJsonList(json['badges']),
      memberSince: json['profile']['member_since'],
    );
  }
}