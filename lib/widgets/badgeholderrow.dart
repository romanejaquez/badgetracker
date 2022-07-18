import 'package:flutter/material.dart';

class BadgeHolderRow extends StatelessWidget {
  const BadgeHolderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 150,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text('John Smith'),
          SizedBox(width: 10),
          Icon(Icons.account_circle, color: Colors.grey, size: 60),
        ],
      ),
    );
  }
}