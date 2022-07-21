import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/models/session.dart';
import 'package:badgetracker/services/badgeholderservice.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BadgeHolderDialog extends StatefulWidget {
  const BadgeHolderDialog({Key? key}) : super(key: key);

  @override
  State<BadgeHolderDialog> createState() => _BadgeHolderDialogState();
}

class _BadgeHolderDialogState extends State<BadgeHolderDialog> with SingleTickerProviderStateMixin {
  AnimationController? dialogAnimController;

  @override 
  void initState() {
    super.initState();

    dialogAnimController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    )..forward();
  }

  @override 
  void dispose() {
    dialogAnimController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    BadgeHolderService badgeHolderService = Provider.of<BadgeHolderService>(context, listen: false);
    BadgeHolder holder = badgeHolderService.selectedBadgeHolder!;
    
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
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Utils.mainBlue,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Text('${holder.badges.length}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Total Number of\nBadges Earned', 
                        textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 12)
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Utils.mainBlue,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Text('${Utils.totalBadgesInCampaign()}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Total Number of\nBadges In Campaign', 
                        textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 12)
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Utils.mainBlue,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Text('${Utils.remainingTotalBadgesToCompleteCampaign(holder)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Remaining Badges\nOn RTC Campaign',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 12)
                        )
                      ],
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
                  children: List.generate(Utils.getDefaultSessions().length, (index) {
                    Session currentSession = Utils.getDefaultSessions()[index];
                    
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Utils.isSessionCompleteFromBadgeHolder(currentSession,
                        holder.badges) ? Utils.mainYellow : Utils.mainYellow.withOpacity(0.2)
                      ),
                      child: Text(Utils.getCompletedBadgesFromSession(currentSession,
                        holder.badges),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)  
                      )
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