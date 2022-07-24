import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';

class BadgeCountMeter extends StatelessWidget {
  const BadgeCountMeter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
      child: Column(
        children: [
          Row(
            children: [
                Row(
                  children: [
                  Text('24',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Utils.mainYellow)
                  ),
                  const SizedBox(width: 10),
                  Text('Current Badge\nGroup Count',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Utils.mainYellow)
                  ),
                ]
                ),
                Spacer(),
                Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Goal Number Of\nBadges as a Group',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Utils.mainYellow)
                  ),
                  const SizedBox(width: 10),
                  Text('50', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Utils.mainYellow)),
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
                          Container(
                            alignment: Alignment.centerRight,
                            width: constraints.maxWidth / 2,
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
}