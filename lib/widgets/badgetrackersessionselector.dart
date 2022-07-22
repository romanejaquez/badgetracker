import 'package:badgetracker/models/session.dart';
import 'package:badgetracker/services/session.service.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BadgeTrackerSessionSelector extends StatefulWidget {
  const BadgeTrackerSessionSelector({Key? key}) : super(key: key);

  @override
  State<BadgeTrackerSessionSelector> createState() => _BadgeTrackerSessionSelectorState();
}

class _BadgeTrackerSessionSelectorState extends State<BadgeTrackerSessionSelector> with SingleTickerProviderStateMixin {

  late AnimationController fadeAnim;

  @override
  void initState() {
    super.initState();

    fadeAnim = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(parent: fadeAnim, curve: Curves.easeInOut)),
      child: Container(
        padding: const EdgeInsets.only(left: 40, right: 20, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Utils.lightBlue,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          children: [
            const Text('Sessions',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Utils.mainBlue)
            ),
            const SizedBox(width: 40),
            Expanded(
              child: Consumer<SessionService>(
                builder: (context, service, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(service.allSessions.length, (index) {
                      Session currentSession = service.allSessions[index];
                      
                      return GestureDetector(
                        onTap: () {
                          service.selectCurrentSession(currentSession);
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: service.selectedSession == currentSession ? Utils.mainBlue : Colors.transparent,
                              border: Border.all(
                                color: Utils.mainBlue,
                                width: 4
                              ),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            alignment: Alignment.center,
                            child: Text('${currentSession.index + 1}',
                              style: TextStyle(
                                color: service.selectedSession == currentSession ? Colors.white : Utils.mainBlue, fontWeight: FontWeight.bold, fontSize: 20)
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
              ),
            )
          ],
        )
      ),
    );
  }
}