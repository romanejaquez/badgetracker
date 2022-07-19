import 'package:badgetracker/models/session.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BadgeTrackerTimeline extends StatelessWidget {
  const BadgeTrackerTimeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text('${Utils.getRemainingDays()}',
                style: TextStyle(
                  color: Utils.mainGreen,
                  fontSize: 70,
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Days until\nCampaign Completion',
                    style: TextStyle(fontSize: 16, color: Utils.mainGreen)
                  ),
                  Text('${Utils.getCompletedSessions()} Sessions Completed',
                    style: const TextStyle(fontSize: 16, color: Utils.mainGreen)
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(Utils.getDefaultSessions().length, (index) {
                    
                    Session currentSession = Utils.getDefaultSessions()[index];

                    return Container(
                      width: 100,
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: currentSession.isComplete ? Utils.lightGreen : Colors.transparent
                        ),
                      ),
                    );
                  }),
                ),

                /*Container(
                  margin: const EdgeInsets.only(top: 10.5, left: 50, right: 50),
                  height: 25,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: (constraints.maxWidth * 0.1) - Utils.getDaysIntoCampaign() * 0.1,
                        decoration: const BoxDecoration(
                          color: Utils.lightGreen
                        ),
                      );
                    }
                  )
                ),*/

                Container(
                  margin: const EdgeInsets.only(top: 18, left: 50, right: 50),
                  child: Row(
                    children: List.generate(Utils.getDefaultSessions().length - 1, (index) {

                      return Expanded(
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: index < Utils.getDefaultSessions().length - 1 &&
                              Utils.getDefaultSessions()[index + 1].isComplete ? Utils.mainGreen : Utils.lightGrey
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(Utils.getDefaultSessions().length, (index) {
                    
                    Session currentSession = Utils.getDefaultSessions()[index];
                    
                    return SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: currentSession.isComplete ? Utils.mainGreen : Utils.lightGrey
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Session ${currentSession.index + 1}', textAlign: TextAlign.center,
                            style: const TextStyle(color: Utils.mainGreen, fontSize: 20, fontWeight: FontWeight.bold)
                          ),
                          Text(
                          DateFormat.MMMd().format(DateTime.parse(currentSession.date)), textAlign: TextAlign.center,
                            style: const TextStyle(color: Utils.darkGrey)
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