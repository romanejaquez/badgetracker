import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/models/session.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';

class BadgeHolderRow extends StatelessWidget {
  BadgeHolder badgeHolder;

  BadgeHolderRow({Key? key, required this.badgeHolder }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(badgeHolder.name),
          const SizedBox(width: 10),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Utils.lightGrey,
                width: 4
              ),
              image: DecorationImage(
                image: NetworkImage(badgeHolder.imgUrl),
                fit: BoxFit.cover
              )
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 50,
            child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: List.generate(Utils.getDefaultSessions().length, (index) {

                Session currentSession = Utils.getDefaultSessions()[index];
                
                return Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Utils.isSessionCompleteFromBadgeHolder(currentSession,
                    badgeHolder.badges) ? Utils.mainYellow : Utils.mainYellow.withOpacity(0.2)
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}