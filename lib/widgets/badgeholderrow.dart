import 'package:badgetracker/utils/utils.dart';
import 'package:flutter/material.dart';

class BadgeHolderRow extends StatelessWidget {
  const BadgeHolderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('John Smith'),
          SizedBox(width: 10),
          Icon(Icons.account_circle, color: Colors.grey, size: 60),
          SizedBox(width: 10),
          SizedBox(
            width: 50,
            child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: List.generate(6, (index) {
                return Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Utils.mainYellow
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}