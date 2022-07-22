import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/utils/utils.dart';
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
        children: [
          Row(
            children: [
              Text('${badgeHolders.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Utils.mainYellow, fontSize: 70
                )
              ),
              const SizedBox(width: 5),
              const Text('Future\nGoogle Certified\nCloud Engineers',
                style: TextStyle(color: Utils.mainYellow)
              )
            ]
          ),
          const SizedBox(height: 10),
          ...List.generate(badgeHolders.length, (index) {

          BadgeHolder badgeHolder = badgeHolders[index];

          return BadgeHolderRow(
            badgeHolder: badgeHolder
          );
        })
        ],
      ),
    );
  }
}