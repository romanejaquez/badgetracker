import 'package:badgetracker/models/badge.dart';

class Session {

  int index;
  String date;
  bool isSelected;
  List<BadgeModel> badges; 
  bool isComplete;

  Session({
    required this.index,
    required this.date,
    required this.isSelected,
    required this.badges,
    required this.isComplete
  });

  factory Session.fromJson(Map<String, dynamic> jsonSession) {
    return Session(
      index: jsonSession['index'],
      date: jsonSession['date'],
      isSelected: jsonSession['isSelected'],
      badges: BadgeModel.fromJsonList(jsonSession['badges'] as List<dynamic>),
      isComplete: jsonSession['isComplete']
    );
  }
}