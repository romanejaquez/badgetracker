import 'package:badgetracker/models/badge.dart';
import 'package:badgetracker/models/badgeholder.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static const Color darkGrey = Color(0xFF555555);
  static const Color lightBlue = Color(0xFFEFF9FF);
  static const Color mainBlue = Color(0xFF008DE5);
  static const Color mainGreen = Color(0xFF34A853);
  static const Color lightGrey = Color(0xFFE5E5E5);
  static const Color lightGreen = Color.fromARGB(255, 223, 243, 228);
  static const Color mainYellow = Color(0xFFFBBC39);
  static const Color mainRed = Color(0xFFEA4335);
  static const Color superLightGrey = Color.fromARGB(255, 251, 251, 251);

  static BadgeModel getBadgeFromUser(BadgeHolder badgeHolder, BadgeModel systemBadge) {
    return badgeHolder.badges.where((b) => b.badgeTitle == systemBadge.badgeTitle).first;
  }

  static void launchUrlLink(String url) async {
    await launchUrl(Uri.parse(url));
  }
}