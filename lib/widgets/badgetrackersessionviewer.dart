import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/services/proxyservice.dart';
import 'package:badgetracker/widgets/badgeholderlist.dart';
import 'package:badgetracker/widgets/badgetracker.dart';
import 'package:badgetracker/widgets/badgetrackersessionselector.dart';
import 'package:flutter/material.dart';

class BadgeTrackerSessionViewer extends StatelessWidget {
  const BadgeTrackerSessionViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BadgeTrackerSessionSelector(),
          const SizedBox(height: 30),
          FutureBuilder(
            future: HttpProxyService.getBadgeHolders(),
            builder: (context, snapshot) {

              if (snapshot.hasError) {
                return Text('Error');
              }

              else if (!snapshot.hasData) {
                return Text('No Data');
              }

              List<BadgeHolder> badgeHolders = snapshot.data as List<BadgeHolder>;
              
              return Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BadgeHolderList(
                    badgeHolders: badgeHolders,
                  ),
                  const SizedBox(width: 30),
                  Center(child: BadgeTracker(
                    badgeHolders: badgeHolders
                  ))
                ],
              );
            }
          )
        ],
      ),
    );
  }
}