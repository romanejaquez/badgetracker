import 'dart:async';

import 'package:badgetracker/services/session.service.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CampaignCountNumber extends StatefulWidget {
  const CampaignCountNumber({Key? key}) : super(key: key);

  @override
  State<CampaignCountNumber> createState() => _CampaignCountNumberState();
}

class _CampaignCountNumberState extends State<CampaignCountNumber> {

  int finalCount = 0; 
  int daysCount = 0;

  @override
  void initState() {
    super.initState();
    finalCount = context.read<SessionService>().getRemainingDays();
  }

  @override
  Widget build(BuildContext context) {

    Timer.periodic(const Duration(milliseconds: 80), (timer) {
      if (daysCount >= finalCount) {
        timer.cancel();
      }
      else {
        setState(() {
          daysCount++;
        });
      }
    });
    
    return SizedBox(
      width: 90,
      child: Text('$daysCount',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Utils.mainGreen,
          fontSize: 70,
          fontWeight: FontWeight.bold
        )
      ),
    );
  }
}