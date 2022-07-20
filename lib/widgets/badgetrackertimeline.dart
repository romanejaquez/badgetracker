import 'package:badgetracker/models/session.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:badgetracker/widgets/campaingcount.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BadgeTrackerTimeline extends StatefulWidget {
  const BadgeTrackerTimeline({Key? key}) : super(key: key);

  @override
  State<BadgeTrackerTimeline> createState() => _BadgeTrackerTimelineState();
}

class _BadgeTrackerTimelineState extends State<BadgeTrackerTimeline> with SingleTickerProviderStateMixin {

  late AnimationController stepCircleCtrl;
  double completedSessionsWidth = 0;

  @override
  void initState() {
    super.initState();

    stepCircleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000)
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CampaignCount(),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.5, left: 50, right: 50),
                  height: 25,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Utils.superLightGrey
                        ),
                      );
                    }
                  )
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(Utils.getDefaultSessions().length, (index) {
                    
                    return Container(
                      width: 100,
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Utils.superLightGrey
                        ),
                      ),
                    );
                  }),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 18, left: 50, right: 50),
                  height: 10,
                  child: LayoutBuilder(
                    builder: (context, constraints) {

                      if (Utils.getCompletedSessions() > 1) {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          setState(() {
                            completedSessionsWidth = (constraints.maxWidth / (Utils.getDefaultSessions().length - 1)) * (Utils.getCompletedSessions() - 1);
                          });
                        });
                      }

                      return AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                        width: completedSessionsWidth,
                        decoration: BoxDecoration(
                          color: Utils.mainGreen,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      );
                    }
                  )
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(Utils.getDefaultSessions().length, (index) {
                    
                    double interval = 0.18;
                    Session currentSession = Utils.getDefaultSessions()[index];
                    
                    return SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.0,
                              end: 1.0
                            ).animate(CurvedAnimation(
                              parent: stepCircleCtrl, 
                              curve: Interval(0.10 * (index), (0.10 * (index + 1)) - 0.05, curve: Curves.easeInOut)
                              )
                            ),
                            child: Container(
                              width: 25,
                              height: 25,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: currentSession.isComplete ? Utils.mainGreen : Utils.lightGrey
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Session ${currentSession.index + 1}', textAlign: TextAlign.center,
                            style: TextStyle(
                              color: currentSession.isComplete ? Utils.mainGreen : Utils.lightGrey,
                              fontSize: 20, fontWeight: FontWeight.bold)
                          ),
                          Text(
                          DateFormat.MMMd().format(DateTime.parse(currentSession.date)), textAlign: TextAlign.center,
                            style: TextStyle(
                              color: currentSession.isComplete ? Utils.darkGrey : Utils.lightGrey)
                          )
                        ],
                      ),
                    );
                  }),
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}