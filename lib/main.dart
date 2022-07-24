import 'package:badgetracker/pages/bagdgetrackersplash.dart';
import 'package:badgetracker/services/badgeholderservice.dart';
import 'package:badgetracker/services/session.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BadgeHolderService()),
        ChangeNotifierProvider(create: (_) => SessionService())
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Product Sans Regular'
        ),
        debugShowCheckedModeBanner: false,
        home: const BadgeTrackerSplash()
      )
    )
  );
}

