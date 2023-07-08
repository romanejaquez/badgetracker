import 'dart:convert';
import 'package:badgetracker/models/badge.dart';
import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/models/session.dart';
import 'package:flutter/material.dart';

class SessionService extends ChangeNotifier {

  Session? selectedSession;
  List<Session> allSessions = [];
  String campaignName = '';
  String communityName = '';
  String communityLink = '';
  String badgeTrackerEndpoint = '';

  Future<bool> initializeSessions(BuildContext context) async {

    try {
      final jsonString = await DefaultAssetBundle.of(context).loadString('assets/config/badgeconfig.json');
      
      Map<String, dynamic> badgeConfig = json.decode(jsonString) as Map<String, dynamic>;
      campaignName = badgeConfig['campaign'];
      communityName = badgeConfig['community'];
      communityLink = badgeConfig['link'];
      badgeTrackerEndpoint = badgeConfig['badgesEndpoint'];
      var decodedJson = badgeConfig['sessions'] as List<dynamic>;

      var today = DateTime.now();

      var jsonSessions = decodedJson.map((jsonSession) {
        return Session.fromJson(jsonSession);
      }).toList();

      for(var session in jsonSessions) {
        var sessionDate = DateTime.parse(session.date);
        session.isComplete = today.isAfter(sessionDate);
      }

      allSessions = jsonSessions.toList();
      selectedSession = allSessions.first;
    }
    on Exception {
      return false;
    }

    return true;
  }

  List<Session> getDefaultSessions() {
    return allSessions;
  }

  int totalBadgesInCampaign() {
    int totalBadges = 0;
    for (var element in allSessions) {
      totalBadges += element.badges.length;
    }

    return totalBadges;
  }

  bool checkForSessionCompletion(String badgeName) {
    return allSessions.any((s) => s.badges.any(
      (b) => b.badgeTitle.trim().toLowerCase() == badgeName.trim().toLowerCase()
      )
    );
  }

  bool isSessionCompleteFromBadgeHolder(Session session, List<BadgeModel> badgeHolderBadges) {
    var allComplete = true;

    for(var badgeModel in session.badges) {
      if (!badgeHolderBadges.any((b) => b.badgeTitle.trim().toLowerCase() == badgeModel.badgeTitle.trim().toLowerCase())) {
        allComplete = false;
        break;
      }
    }

    return allComplete;
  }

  int remainingTotalBadgesToCompleteCampaign(BadgeHolder badgeHolder) {
    List<BadgeModel> remainingBadges = [];
    int totalBadges = totalBadgesInCampaign();

    for(var session in allSessions) {
      for (var sessionBadge in session.badges) {
        if (badgeHolder.badges.any((b) => b.badgeTitle.trim().toLowerCase() == sessionBadge.badgeTitle.trim().toLowerCase())) {
          var foundBadge = badgeHolder.badges.where((b) => b.badgeTitle.trim().toLowerCase() == sessionBadge.badgeTitle.trim().toLowerCase()).first;

          if (!remainingBadges.any((b) => b.badgeTitle.trim().toLowerCase() == foundBadge.badgeTitle.trim().toLowerCase())) {
            remainingBadges.add(foundBadge);
          }
        }
      }
    }

    return totalBadges - remainingBadges.length;
  }

  String getCompletedBadgesFromSession(Session session, List<BadgeModel> badgeHolderBadges) {
    List<BadgeModel> foundBadges = [];

    for(var badge in session.badges) {
      if (badgeHolderBadges.any((b) => b.badgeTitle.trim().toLowerCase() == badge.badgeTitle.trim().toLowerCase())) {
        var foundBadge = badgeHolderBadges.where((b) => b.badgeTitle.trim().toLowerCase() == badge.badgeTitle.trim().toLowerCase()).first;
        
        if (!foundBadges.any((b) => b.badgeTitle.trim().toLowerCase() == foundBadge.badgeTitle.trim().toLowerCase())) {
          foundBadges.add(foundBadge);
        }
      }
    }

    return '${foundBadges.length}/${session.badges.length}';
  }

  int getRemainingDays() {
    var today = DateTime.now();
    var lastSession = allSessions.last;
    var lDate = DateTime.parse(lastSession.date);
    var remainingDays = lDate.difference(today).inDays;
    return remainingDays;
  }

  int getTotalDays() {
    var firstSession = allSessions.first;
    var lastSession = allSessions.last;
    var fDate = DateTime.parse(firstSession.date);
    var lDate = DateTime.parse(lastSession.date);
    var totalDaysInCampaign = lDate.difference(fDate).inDays;
    return totalDaysInCampaign;
  }

  int getCompletedSessions() {
    return allSessions.where((s) => s.isComplete).length;
  }

  int getDaysIntoCampaign() {
    var today = DateTime.now();
    var firstSession = allSessions.first;
    var fDate = DateTime.parse(firstSession.date);
    
    var remainingDays = today.difference(fDate).inDays;
    return remainingDays;
  }

  double daysInCampaign() {
    return getDaysIntoCampaign() / 100;
  }

  int totalBadgesAmongBadgeHolders(List<BadgeHolder> badgeHolders) {
    int completedBadges = 0;

    for (var session in allSessions) {
      for(var badge in session.badges) {
        for(var holder in badgeHolders) {
          if (holder.badges.any((b) => b.badgeTitle.trim().toLowerCase() == badge.badgeTitle.trim().toLowerCase())) {
            completedBadges++;
          }
        }
      }
    }

    return completedBadges;
  }

  void selectCurrentSession(Session currentSession) {
    selectedSession = currentSession;
    notifyListeners();
  }
}