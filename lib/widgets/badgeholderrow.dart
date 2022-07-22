import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/models/session.dart';
import 'package:badgetracker/services/badgeholderservice.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BadgeHolderRow extends StatelessWidget {
  final BadgeHolder badgeHolder;

  const BadgeHolderRow({Key? key, required this.badgeHolder }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BadgeHolderService bhService = Provider.of<BadgeHolderService>(context, listen: false);
        bhService.showBadgeHolder(context, badgeHolder);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(badgeHolder.name),
              const SizedBox(width: 10),
              SizedBox(
                width: 60,
                height: 60,
                child: Stack(
                  children: [
                    const Center(
                      child: Icon(Icons.account_circle, color: Utils.lightGrey, size: 60)
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Utils.lightGrey,
                          width: 4
                        ),
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: NetworkImage(badgeHolder.imgUrl),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ],
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
        ),
      ),
    );
  }
}