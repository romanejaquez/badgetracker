import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';

class BadgeTrackerHeader extends StatelessWidget {
  const BadgeTrackerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset('./assets/imgs/gcloud.png',
                width: 125,
                height: 125,
                fit: BoxFit.contain
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Road to Certification',
                    style: TextStyle(color: Utils.darkGrey, fontSize: 15)
                  ),
                  const Text('Badge Tracker',
                    style: TextStyle(color: Utils.darkGrey, fontSize: 30, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Utils.mainBlue.withOpacity(0.2),
                        width: 3
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text(
                      'Associate Cloud Engineer',
                      style: TextStyle(color: Utils.mainBlue)
                    )
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}