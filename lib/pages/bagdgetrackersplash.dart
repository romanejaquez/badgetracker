import 'dart:async';
import 'package:badgetracker/pages/badgetrackermain.dart';
import 'package:badgetracker/services/session.service.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:badgetracker/widgets/badgetrackerlogo.dart';
import 'package:badgetracker/widgets/gcloudlogoanim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BadgeTrackerSplash extends StatefulWidget {

  const BadgeTrackerSplash({super.key});

  @override
  State<BadgeTrackerSplash> createState() => _BadgeTrackerSplashState();
}

class _BadgeTrackerSplashState extends State<BadgeTrackerSplash> with TickerProviderStateMixin {

  late AnimationController ctrl;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    ctrl = AnimationController(vsync: this,
      duration: const Duration(seconds: 1)
    )..forward();
  }

  @override
  void dispose() {
    timer.cancel();
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Utils.mainBlue,
      body: Stack(
        children: [
          Consumer<SessionService>(
            builder: (context, service, child) {

              timer = Timer(const Duration(seconds: 2), () {

                service.initializeSessions(context).then((success) {

                  ctrl.reverse().then((value) {
                    timer.cancel();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const BadgeTrackerApp())
                    );
                  });
                  
                });
              });
              return Center(
                child: SizedBox(
                  width: 390,
                  child: FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0)
                    .animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)),
                    child: Stack(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: BadgeTrackerLogo(
                            size: Size(120, 120),
                          )
                        ),
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.25, 0.0),
                            end: const Offset(0.0, 0.0)
                          ).animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
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
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          )
        ],
      )
    );
  }
}