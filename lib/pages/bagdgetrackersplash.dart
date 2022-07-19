import 'dart:async';

import 'package:badgetracker/pages/badgetrackermain.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:badgetracker/widgets/gcloudlogoanim.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BadgeTrackerSplash extends StatefulWidget {
  const BadgeTrackerSplash({Key? key}) : super(key: key);

  @override
  State<BadgeTrackerSplash> createState() => _BadgeTrackerSplashState();
}

class _BadgeTrackerSplashState extends State<BadgeTrackerSplash> with SingleTickerProviderStateMixin {

  late AnimationController ctrl;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    ctrl = AnimationController(vsync: this,
      duration: const Duration(seconds: 1)
    )..forward();

    timer = Timer(const Duration(seconds: 4), () {
      ctrl.reverse().then((value) {
        timer.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BadgeTrackerApp())
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Utils.mainBlue,
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: Tween<double>(
                begin: 0.0,
                end: 1.0
              ).animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.09),
                  end: const Offset(0.0, 0.0),
                ).animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: const [
                        Opacity(
                          opacity: 0.2,
                          child: GCloudLogoAnim(animate: false)
                        ),
                        GCloudLogoAnim(animate: true),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Road to Certification',
                          style: TextStyle(color: Colors.white, fontSize: 25)
                        ),
                        Text('Badge Tracker',
                          style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)
                        ),
                      ]
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}