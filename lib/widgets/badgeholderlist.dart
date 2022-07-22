import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:badgetracker/widgets/badgeholderrow.dart';
import 'package:flutter/material.dart';

class BadgeHolderList extends StatefulWidget {
  List<BadgeHolder> badgeHolders;

  BadgeHolderList({Key? key, required this.badgeHolders }) : super(key: key);

  @override
  State<BadgeHolderList> createState() => _BadgeHolderListState();
}

class _BadgeHolderListState extends State<BadgeHolderList> with SingleTickerProviderStateMixin {
  late AnimationController rowAnim;
  double rowDuration = 0;

  @override
  void initState() {
    super.initState();

    int listDuration = (widget.badgeHolders.length / 3 * 1000).toInt();
    rowDuration = (1.0 / widget.badgeHolders.length);
    rowAnim = AnimationController(vsync: this,
      duration: Duration(milliseconds: listDuration)
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text('${widget.badgeHolders.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Utils.mainYellow, fontSize: 70
                )
              ),
              const SizedBox(width: 5),
              const Text('Future\nGoogle Certified\nCloud Engineers',
                style: TextStyle(color: Utils.mainYellow)
              )
            ]
          ),
          const SizedBox(height: 10),
          ...List.generate(widget.badgeHolders.length, (index) {

          BadgeHolder badgeHolder = widget.badgeHolders[index];

          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
              parent: rowAnim, 
              curve: Interval(index * rowDuration, (index + 1) * rowDuration, curve: Curves.easeInOut)
              )
            ),
            child: BadgeHolderRow(
              badgeHolder: badgeHolder
            ),
          );
        })
        ],
      ),
    );
  }
}