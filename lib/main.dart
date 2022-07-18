import 'package:badgetracker/services/session.service.dart';
import 'package:badgetracker/widgets/badgetrackerheader.dart';
import 'package:badgetracker/widgets/badgetrackersessionviewer.dart';
import 'package:badgetracker/widgets/badgetrackertimeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SessionService())
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Product Sans Regular'
        ),
        debugShowCheckedModeBanner: false,
        home: const BadgeTrackerApp()
      )
    )
  );
}

class BadgeTrackerApp extends StatelessWidget {
  const BadgeTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: const [
                BadgeTrackerHeader(),
                BadgeTrackerTimeline(),
                BadgeTrackerSessionViewer()
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Image.asset('assets/imgs/flutterlogo.png',
              width: 200
            )
          )
        ],
      ),
    );
  }
}