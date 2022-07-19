import 'package:badgetracker/models/badge.dart';

class BadgeHolder {

  String name;
  String imgUrl;
  List<Badge> badges;

  BadgeHolder({
    required this.name,
    required this.imgUrl,
    required this.badges
  });

  factory BadgeHolder.fromJson(Map<String, dynamic> json) {
    return BadgeHolder(
      name: json['profile']['name'], 
      imgUrl: json['profile']['avatar'],
      badges: Badge.fromJsonList(json['badges'])
    );
  }
}