import 'package:badgetracker/models/badge.dart';

class Session {

  int index;
  String date;
  bool isSelected;
  List<Badge> badges; 
  bool isComplete;

  Session({
    required this.index,
    required this.date,
    required this.isSelected,
    required this.badges,
    required this.isComplete
  });
}