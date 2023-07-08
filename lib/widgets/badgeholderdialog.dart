import 'dart:async';

import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/models/session.dart';
import 'package:badgetracker/services/badgeholderservice.dart';
import 'package:badgetracker/services/session.service.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:badgetracker/widgets/badgeholderdialogdataitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BadgeHolderDialog extends StatefulWidget {
  const BadgeHolderDialog({Key? key}) : super(key: key);

  @override
  State<BadgeHolderDialog> createState() => _BadgeHolderDialogState();
}

class _BadgeHolderDialogState extends State<BadgeHolderDialog> with TickerProviderStateMixin {
  AnimationController? dialogAnimController;
  AnimationController? dialogInfoController;
  late Timer timer;

  @override 
  void initState() {
    super.initState();

    dialogAnimController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    )..forward();

    dialogInfoController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this
    );

    timer = Timer(const Duration(milliseconds: 500), () {
      dialogInfoController!.forward();
    });
  }

  @override 
  void dispose() {
    dialogAnimController!.dispose();
    dialogInfoController!.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    BadgeHolderService badgeHolderService = Provider.of<BadgeHolderService>(context, listen: false);
    BadgeHolder holder = badgeHolderService.selectedBadgeHolder!;
    var sessionService = context.read<SessionService>();

    return ScaleTransition(
      scale: Tween<double>(begin: 0.5, end: 1.0)
      .animate(CurvedAnimation(parent: dialogAnimController!, curve: Curves.linearToEaseOut)),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: dialogAnimController!, curve: Curves.easeInOut)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Center(
                child: FadeTransition(
                  opacity: Tween<double>(
                      begin: 0.0, end: 1.0
                    ).animate(CurvedAnimation(parent: dialogAnimController!, curve: Curves.easeInOut)),
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: 0.5, end: 1.0
                    ).animate(CurvedAnimation(parent: dialogAnimController!, curve: Curves.easeInOut)),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipOval(
                        child: Image.network(
                          holder.imgUrl,
                          width: 80, height: 80, fit: BoxFit.cover)
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(holder.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Utils.mainBlue, fontSize: 20, fontWeight: FontWeight.bold)
              ),
              Text(holder.memberSince, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeTransition(
                    opacity: Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).animate(CurvedAnimation(parent: dialogInfoController!,
                      curve: const Interval(0.0, 0.33, curve: Curves.easeInOut))
                    ),
                    child: BadgeHolderDialogDataItem(
                      amount: holder.badges.length,
                      label: 'Total Number of\nBadges Earned'
                    ),
                  ),
                  FadeTransition(
                    opacity: Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).animate(CurvedAnimation(parent: dialogInfoController!,
                      curve: const Interval(0.33, 0.66, curve: Curves.easeInOut))
                    ),
                    child: BadgeHolderDialogDataItem(
                      amount: sessionService.totalBadgesInCampaign(),
                      label: 'Total Number of\nBadges In Campaign'
                    ),
                  ),
                  FadeTransition(
                    opacity: Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).animate(CurvedAnimation(parent: dialogInfoController!,
                      curve: const Interval(0.66, 0.99, curve: Curves.easeInOut))
                    ),
                    child: BadgeHolderDialogDataItem(
                      amount: sessionService.remainingTotalBadgesToCompleteCampaign(holder),
                      label: 'Remaining Badges\nOn RTC Campaign'
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
                decoration: BoxDecoration(
                  color: Utils.mainYellow,
                  borderRadius: BorderRadius.circular(40)
                ),
                child: const Text(
                  'Badges Completed Per Session',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  )
                )
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: GridView.count(crossAxisCount: 3,
                  children: List.generate(sessionService.getDefaultSessions().length, (index) {
                    double interval = 0.10;
                    Session currentSession = sessionService.getDefaultSessions()[index];
                    
                    return ScaleTransition(
                      scale: Tween<double>(begin: 0.0, end: 1.0)
                        .animate(CurvedAnimation(
                          parent: dialogInfoController!,
                          curve: Interval(index * interval, (index + 1) * interval)
                        )),
                      child: FadeTransition(
                        opacity: Tween<double>(begin: 0.0, end: 1.0)
                        .animate(CurvedAnimation(
                          parent: dialogInfoController!,
                          curve: Interval(index * interval, (index + 1) * interval)
                        )),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: sessionService.isSessionCompleteFromBadgeHolder(currentSession,
                            holder.badges) ? Utils.mainYellow : Utils.mainYellow.withOpacity(0.2)
                          ),
                          child: Text(
                            sessionService.getCompletedBadgesFromSession(currentSession,
                            holder.badges
                          ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)  
                          )
                        ),
                      ),
                    );
                  })
                ),
              )
            ],
          )
        )
      )
    );
  }
}