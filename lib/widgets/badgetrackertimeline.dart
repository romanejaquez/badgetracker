import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';

class BadgeTrackerTimeline extends StatelessWidget {
  const BadgeTrackerTimeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text('56',
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
                  Text('Days until\nCampaign Completion',
                    style: TextStyle(fontSize: 16, color: Utils.mainGreen)
                  ),
                  Text('2 Sessions Completed',
                    style: TextStyle(fontSize: 16, color: Utils.mainGreen)
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
                  children: List.generate(6, (index) {
                    return Container(
                      width: 100,
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: index > 0 ? Colors.transparent : Utils.lightGreen
                        ),
                      ),
                    );
                  }),
                ),

                FractionallySizedBox(
                  widthFactor: 0.2,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.5, left: 50, right: 50),
                    height: 25,
                    decoration: const BoxDecoration(
                      color: Utils.lightGreen
                    ),
                  ),
                )
                ,

                Container(
                  margin: const EdgeInsets.only(top: 18, left: 50, right: 50),
                  child: Row(
                    children: List.generate(5, (index) {
                      return Expanded(
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: index == 0 ? Utils.mainGreen : Utils.lightGrey
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
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
                              color: index < 2 ? Utils.mainGreen : Utils.lightGrey
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Session $index', textAlign: TextAlign.center,
                            style: const TextStyle(color: Utils.mainGreen, fontSize: 20, fontWeight: FontWeight.bold)
                          ),
                          const Text('July 7', textAlign: TextAlign.center,
                            style: TextStyle(color: Utils.darkGrey)
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