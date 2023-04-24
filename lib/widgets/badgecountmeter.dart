import 'package:badgetracker/services/badgeholderservice.dart';
import 'package:badgetracker/services/session.service.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BadgeCountMeter extends StatelessWidget {
  const BadgeCountMeter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BadgeHolderService>(
      builder: (context, service, child) {

        var sessionService = context.read<SessionService>();

        int currentBadgeCount = service.bagdeholderList.isEmpty ? 0 : sessionService.totalBadgesAmongBadgeHolders(service.bagdeholderList);
        int goalCount = service.bagdeholderList.isEmpty? 0 : sessionService.totalBadgesInCampaign() * service.bagdeholderList.length;

        return Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
          child: Column(
            children: [
              Row(
                children: [
                    Row(
                      children: [
                        Text('$currentBadgeCount',
                        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Utils.mainYellow)
                        ),
                        const SizedBox(width: 10),
                        const Text('Current Badge\nGroup Count',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Utils.mainYellow)
                        ),
                    ]
                    ),
                    const Spacer(),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Goal Number Of\nBadges as a Group',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Utils.mainYellow)
                      ),
                      const SizedBox(width: 10),
                      Text('$goalCount',
                        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Utils.mainYellow)),
                    ]
                  )
                ]
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Utils.mainYellow.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Stack(
                            children: [
                            service.bagdeholderList.isEmpty ? const SizedBox() : 
                            AnimatedContainer(
                              duration: const Duration(seconds: 2),
                              curve: Curves.easeInOut,
                                alignment: Alignment.centerRight,
                                width: (constraints.maxWidth / goalCount) * currentBadgeCount,
                                decoration: BoxDecoration(
                                  color: Utils.mainYellow,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Icon(Icons.wb_cloudy, size: 20, color: Colors.white))
                              ),
                            ],
                          );
                        }
                      )
                    )
                  ),
                ]
              ),
            ]
          ),
        );
      }
    );
  }
}