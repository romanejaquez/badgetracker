import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/widgets/badgeholderrow.dart';
import 'package:flutter/material.dart';

class BadgeHolderList extends StatelessWidget {
  List<BadgeHolder> badgeHolders;

  BadgeHolderList({Key? key, required this.badgeHolders }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(this.badgeHolders.length, (index) {

          BadgeHolder badgeHolder = this.badgeHolders[index];

          return BadgeHolderRow(
            badgeHolder: badgeHolder
          );
        }),
      ),
    );
  }
}