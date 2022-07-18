import 'package:badgetracker/widgets/badgeholderrow.dart';
import 'package:flutter/material.dart';

class BadgeHolderList extends StatelessWidget {
  const BadgeHolderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(5, (index) {
          return BadgeHolderRow();
        }),
      ),
    );
  }
}