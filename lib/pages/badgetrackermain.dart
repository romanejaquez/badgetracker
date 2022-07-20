import 'package:badgetracker/widgets/badgetrackerheader.dart';
import 'package:badgetracker/widgets/badgetrackersessionviewer.dart';
import 'package:badgetracker/widgets/badgetrackertimeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BadgeTrackerApp extends StatelessWidget {
  const BadgeTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: const [
                  BadgeTrackerHeader(),
                  BadgeTrackerTimeline(),
                  BadgeTrackerSessionViewer()
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Opacity(
              opacity: 0.5,
              child: SvgPicture.asset('assets/imgs/flutterlogo.svg',
                width: 200
              ),
            )
          )
        ],
    );
  }
}