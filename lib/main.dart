import 'package:badgetracker/pages/badgetrackermain.dart';
import 'package:badgetracker/pages/bagdgetrackersplash.dart';
import 'package:badgetracker/services/session.service.dart';
import 'package:badgetracker/widgets/badgetrackerheader.dart';
import 'package:badgetracker/widgets/badgetrackersessionviewer.dart';
import 'package:badgetracker/widgets/badgetrackertimeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        home: BadgeTrackerSplash()
      )
    )
  );
}

