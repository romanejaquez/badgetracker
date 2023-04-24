import 'package:badgetracker/models/badge.dart';

class BadgeHolder {

  String name;
  String imgUrl;
  List<BadgeModel> badges;
  String memberSince;

  BadgeHolder({
    required this.name,
    required this.imgUrl,
    required this.badges,
    required this.memberSince
  });

  factory BadgeHolder.fromJson(Map<String, dynamic> json) {
    return BadgeHolder(
      name: json['profile']['name'], 
      imgUrl: json['profile']['avatar'],
      badges: BadgeModel.fromJsonList(json['badges']),
      memberSince: json['profile']['member_since'],
    );
  }
}