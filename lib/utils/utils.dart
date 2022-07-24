import 'package:badgetracker/models/badge.dart';
import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/models/session.dart';
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

  static bool checkForSessionCompletion(String badgeName) {
    return Utils.getDefaultSessions().any((s) => s.badges.any(
      (b) => b.badgeTitle.toLowerCase() == badgeName.toLowerCase()
      )
    );
  }

  static bool isSessionCompleteFromBadgeHolder(Session session, List<Badge> badgeHolderBadges) {
    var allComplete = true;

    for(var badge in session.badges) {
      if (!badgeHolderBadges.any((b) => b.badgeTitle == badge.badgeTitle)) {
        allComplete = false;
        break;
      }
    }

    return allComplete;
  }

  static int remainingTotalBadgesToCompleteCampaign(BadgeHolder badgeHolder) {
    int remaining = 0;
    int totalBadgesInCampaign = Utils.totalBadgesInCampaign();

    for(var session in Utils.getDefaultSessions()) {
      for (var sessionBadge in session.badges) {
        if (badgeHolder.badges.any((b) => b.badgeTitle == sessionBadge.badgeTitle)) {
          remaining += badgeHolder.badges.where((b) => b.badgeTitle == sessionBadge.badgeTitle).length;
        }
      }
    }

    return totalBadgesInCampaign - remaining;
  }

  static String getCompletedBadgesFromSession(Session session, List<Badge> badgeHolderBadges) {
    int completedBadges = 0;

    for(var badge in session.badges) {
      if (badgeHolderBadges.any((b) => b.badgeTitle == badge.badgeTitle)) {
        completedBadges++;
      }
    }

    return '$completedBadges/${session.badges.length}';
  }

  static int totalBadgesAmongBadgeHolders(List<BadgeHolder> badgeHolders) {
    int completedBadges = 0;

    for (var session in Utils.getDefaultSessions()) {
      for(var badge in session.badges) {
        for(var holder in badgeHolders) {
          if (holder.badges.any((b) => b.badgeTitle == badge.badgeTitle)) {
            completedBadges++;
          }
        }
      }
    }

    return completedBadges;
  }

  static int getRemainingDays() {
    var today = DateTime.now(); //parse('2022-09-01');
    var lastSession = Utils.getDefaultSessions().last;
    var lDate = DateTime.parse(lastSession.date);
    var remainingDays = lDate.difference(today).inDays;
    return remainingDays;
  }

  static int getTotalDays() {
    var firstSession = Utils.getDefaultSessions().first;
    var lastSession = Utils.getDefaultSessions().last;
    var fDate = DateTime.parse(firstSession.date);
    var lDate = DateTime.parse(lastSession.date);
    var totalDaysInCampaign = lDate.difference(fDate).inDays;
    return totalDaysInCampaign;
  }

  static int getDaysIntoCampaign() {
    var today = DateTime.now();
    var firstSession = Utils.getDefaultSessions().first;
    var fDate = DateTime.parse(firstSession.date);
    
    var remainingDays = today.difference(fDate).inDays;
    return remainingDays;
  }

  static double daysInCampaign() {
    return Utils.getDaysIntoCampaign() / 100;
  }

  static Badge getBadgeFromUser(BadgeHolder badgeHolder, Badge systemBadge) {
    return badgeHolder.badges.where((b) => b.badgeTitle == systemBadge.badgeTitle).first;
  }

  static int getCompletedSessions() {
    return Utils.getDefaultSessions().where((s) => s.isComplete).length;
  }

  static int totalBadgesInCampaign() {
    int totalBadges = 0;
    Utils.getDefaultSessions().forEach((element) {
      totalBadges += element.badges.length;
    });

    return totalBadges;
  }

  static List<Session> getDefaultSessions() {
    
    var today = DateTime.now(); //parse('2022-09-01');
    var sessions = [
      Session(
        index: 0,
        isSelected: false,
        isComplete: false,
        date: '2022-07-21T00:00:00Z',
        badges: [
          Badge(
            badgeTitle: 'Preparing for Your Associate Cloud Engineer Journey',
            link: 'https://www.cloudskillsboost.google/course_templates/77',
            isComplete: false
          ),
          Badge(
            badgeTitle: 'Google Cloud Fundamentals: Core Infrastructure',
            link: 'https://www.cloudskillsboost.google/course_templates/60',
            isComplete: false
          ),
          Badge(
            badgeTitle: 'Create and Manage Cloud Resources',
            link: 'https://www.cloudskillsboost.google/quests/120',
            isComplete: false
          )
        ]
      ),
      Session(
        index: 1,
        isSelected: false,
        isComplete: false,
        date: '2022-08-04T00:00:00Z',
        badges: [
          Badge(
            badgeTitle: 'Essential Google Cloud Infrastructure: Foundation',
            link: 'https://www.cloudskillsboost.google/course_templates/50',
            isComplete: false
          ),
          Badge(
            badgeTitle: 'Perform Foundational Infrastructure Tasks in Google Cloud',
            link: 'https://www.cloudskillsboost.google/quests/118',
            isComplete: false
          ),
        ]
      ),
      Session(
        index: 2,
        isSelected: false,
        date: '2022-08-18T00:00:00Z',
        isComplete: false,
        badges: [
          Badge(
            badgeTitle: 'Essential Google Cloud Infrastructure: Core Services',
            link: 'https://www.cloudskillsboost.google/course_templates/49',
            isComplete: false
          ),
          Badge(
            badgeTitle: 'Set Up and Configure a Cloud Environment in Google Cloud',
            link: 'https://www.cloudskillsboost.google/quests/119',
            isComplete: false
          ),
        ]
      ),
      Session(
        index: 3,
        isSelected: false,
        date: '2022-09-01T00:00:00Z',
        isComplete: false,
        badges: [
          Badge(
            badgeTitle: 'Elastic Google Cloud Infrastructure: Scaling and Automation',
            link: 'https://www.cloudskillsboost.google/course_templates/178',
            isComplete: false
          ),
          Badge(
            badgeTitle: 'Automating Infrastructure on Google Cloud with Terraform',
            link: 'https://www.cloudskillsboost.google/quests/159',
            isComplete: false
          ),
        ]
      ),
      Session(
        index: 4,
        isSelected: false,
        date: '2022-09-15T00:00:00Z',
        isComplete: false,
        badges: [
          Badge(
            badgeTitle: 'Reliable Google Cloud Infrastructure: Design and Process',
            link: 'https://www.cloudskillsboost.google/course_templates/41',
            isComplete: false
          ),
        ]
      ),
      Session(
        index: 5,
        isSelected: false,
        date: '2022-09-29T00:00:00Z',
        isComplete: false,
        badges: [
          Badge(
            badgeTitle: 'Getting Started with Google Kubernetes Engine',
            link: 'https://www.cloudskillsboost.google/course_templates/2',
            isComplete: false
          ),
          Badge(
            badgeTitle: 'Deploy to Kubernetes in Google Cloud',
            link: 'https://www.cloudskillsboost.google/quests/116',
            isComplete: false
          ),
        ]
      ),
    ];

    for(var session in sessions) {
      var sessionDate = DateTime.parse(session.date);
      session.isComplete = today.isAfter(sessionDate);
    }

    return sessions;
  }

  static void launchUrl(String url) async {
    await launch(url);
  }
}