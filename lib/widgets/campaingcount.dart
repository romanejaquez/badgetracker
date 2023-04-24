import 'package:badgetracker/services/session.service.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:badgetracker/widgets/campaigncountnumber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CampaignCount extends StatelessWidget {
  const CampaignCount({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    var sessionService = context.read<SessionService>();
    
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
            Text('${sessionService.getCompletedSessions()} Session(s) Completed',
              style: const TextStyle(fontSize: 16, color: Utils.mainGreen)
            )
          ],
        )
      ],
    );
  }
}