import 'package:badgetracker/models/badge.dart';
import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/models/session.dart';
import 'package:badgetracker/services/session.service.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BadgeTracker extends StatelessWidget {
  List<BadgeHolder> badgeHolders;

  BadgeTracker({Key? key, required this.badgeHolders }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionService>(
      builder: (context, service, child) {

        Session selectedSession = service.selectedSession!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${selectedSession.badges.length} Badge(s)',
              style: const TextStyle(color: Utils.mainBlue, fontSize: 20, fontWeight: FontWeight.bold)
            ),
            Container(
              color: Utils.mainBlue,
              height: 50,
              margin: const EdgeInsets.only(top: 10),
              width: 5,
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Utils.mainBlue, width: 5),
                  left: BorderSide(color: Utils.mainBlue, width: 5),
                  right: BorderSide(color: Utils.mainBlue, width: 5),
                )
              ),
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  selectedSession.badges.length,
                  (index) {
                    Badge badge = selectedSession.badges[index];
                    return GestureDetector(
                      onTap: () {
                        Utils.launchUrl(badge.link);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: 150,
                          child: Text(badge.badgeTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Utils.mainBlue)
                          )),
                      ),
                    );
                  }),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: List.generate(badgeHolders.length, (index) {
                  BadgeHolder currentBadgeHolder = badgeHolders[index];

                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      selectedSession.badges.length,

                      (index) {
                        Badge currentBadge = selectedSession.badges[index];
                        bool isBadgeComplete = currentBadgeHolder.badges.where((b) => b.badgeTitle == currentBadge.badgeTitle).isNotEmpty;

                        return Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: 150,
                          height: 80,
                          child: Icon(
                            isBadgeComplete ? Icons.check_circle : Icons.circle_outlined,
                            color: Utils.mainBlue, size: 40)
                        );
                      }),
                  );
                }),
              ),
            )
          ],
        );
      }
    );
  }
}