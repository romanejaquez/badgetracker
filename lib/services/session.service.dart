import 'package:badgetracker/models/session.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';

class SessionService extends ChangeNotifier {

  Session? selectedSession;
  List<Session> allSessions = Utils.getDefaultSessions();

  SessionService() {
    selectedSession = allSessions.first;
  }

  void selectCurrentSession(Session currentSession) {
    selectedSession = currentSession;
    notifyListeners();
  }
}