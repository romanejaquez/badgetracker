import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/widgets/badgeholderdialog.dart';
import 'package:flutter/material.dart';

class BadgeHolderService extends ChangeNotifier {

  BadgeHolder? selectedBadgeHolder;
  List<BadgeHolder> bagdeholderList = [];

  void setBadgeHolders(List<BadgeHolder> badgeholders) {
    bagdeholderList = badgeholders;
    notifyListeners();
  }

  void showBadgeHolder(BuildContext context, BadgeHolder holder) {
    selectedBadgeHolder = holder;
    showDialog(context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: BadgeHolderDialog(),
        );
      });
  }
}