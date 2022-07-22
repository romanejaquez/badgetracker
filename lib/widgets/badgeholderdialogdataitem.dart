import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';

class BadgeHolderDialogDataItem extends StatelessWidget {

  final int amount;
  final String label;
  const BadgeHolderDialogDataItem({Key? key,
    required this.amount, required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Utils.mainBlue,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Text('$amount',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)
            ),
          ),
          const SizedBox(height: 10),
          Text(label, 
          textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 12)
          )
        ],
      ),
    );
  }
}