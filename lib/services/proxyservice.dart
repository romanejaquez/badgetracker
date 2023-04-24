import 'dart:async';
import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/services/badgeholderservice.dart';
import 'package:badgetracker/services/session.service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:provider/provider.dart';

class HttpProxyService {

  static Future<List<BadgeHolder>> getBadgeHolders(BuildContext context) {

    var sessionService = context.read<SessionService>();
    List<BadgeHolder> badgeHolders = [];
    Completer<List<BadgeHolder>> badgeHoldersCompleter = Completer();

    var url = Uri.parse(sessionService.badgeTrackerEndpoint);
    
    http.get(url).then((response) {

      var parsedJSON = convert.jsonDecode(response.body);

      if (response.statusCode == 200) {

        

        for(var badgeHolder in parsedJSON) {

          var badgeHolderModel = BadgeHolder.fromJson(badgeHolder);
          
          for (var badge in badgeHolderModel.badges) {
            badge.isComplete = sessionService.checkForSessionCompletion(badge.badgeTitle);
          }

          badgeHolders.add(badgeHolderModel);
        }

        badgeHolders.sort(((a, b) {
          if (a.badges.length < b.badges.length) {
            return 1;
          }

          if (a.badges.length > b.badges.length) {
            return -1;
          }
          return 0;
        }));
        
        BadgeHolderService bhService = Provider.of<BadgeHolderService>(context, listen: false);
        bhService.setBadgeHolders(badgeHolders);

        badgeHoldersCompleter.complete(badgeHolders);
      }
      else {
        badgeHoldersCompleter.completeError(
          const AsyncSnapshot.withError(ConnectionState.done, 'error')
        );
      }
    }).onError((error, stackTrace) {
      badgeHoldersCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    }).catchError((error) {
      badgeHoldersCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    });

    return badgeHoldersCompleter.future;    
  }
}