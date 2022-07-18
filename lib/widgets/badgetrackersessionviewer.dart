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
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              BadgeHolderList(),
              SizedBox(width: 30),
              Center(child: BadgeTracker())
            ],
          )
        ],
      ),
    );
  }
}