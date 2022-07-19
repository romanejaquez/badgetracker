import 'dart:async';
import 'package:badgetracker/models/badgeholder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpProxyService {

  static const String BASE_URL = 'https://us-central1-romanjustcodes.cloudfunctions.net/';
  static const String BADGES_ENDPOINT = 'getBadges';

  static Future<List<BadgeHolder>> getBadgeHolders() {
    List<BadgeHolder> badgeHolders = [];
    Completer<List<BadgeHolder>> badgeHoldersCompleter = Completer();

    var url = Uri.parse(BASE_URL + BADGES_ENDPOINT);
    http.get(url).then((response) {

      var parsedJSON = convert.jsonDecode(response.body);

      if (response.statusCode == 200) {
        
        for(var badgeHolder in parsedJSON) {
          badgeHolders.add(BadgeHolder.fromJson(badgeHolder));
        }

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