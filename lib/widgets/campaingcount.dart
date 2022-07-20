import 'package:badgetracker/utils/utils.dart';
import 'package:badgetracker/widgets/campaigncountnumber.dart';
import 'package:flutter/material.dart';

class CampaignCount extends StatelessWidget {
  const CampaignCount({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CampaignCountNumber(),
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
    );
  }
}