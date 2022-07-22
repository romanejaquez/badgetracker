import 'package:badgetracker/models/badgeholder.dart';
import 'package:badgetracker/services/proxyservice.dart';
import 'package:badgetracker/utils/utils.dart';
import 'package:badgetracker/widgets/badgeholderlist.dart';
import 'package:badgetracker/widgets/badgetracker.dart';
import 'package:badgetracker/widgets/badgetrackersessionselector.dart';
import 'package:badgetracker/widgets/gcloudlogoanim.dart';
import 'package:flutter/material.dart';

class BadgeTrackerSessionViewer extends StatelessWidget {
  const BadgeTrackerSessionViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BadgeTrackerSessionSelector(),
          const SizedBox(height: 40),
          FutureBuilder(
            future: HttpProxyService.getBadgeHolders(),
            builder: (context, snapshot) {

              if (snapshot.hasError) {
                return SizedBox(
                  height: 300,
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.warning, color: Utils.mainRed, size: 60),
                            SizedBox(height: 10),
                            Text('Error Fetching Badge Data', textAlign: TextAlign.center,
                              style: TextStyle(color: Utils.mainRed)
                            )
                          ],
                        )
                      )
                    ],
                  ),
                );
              }

              else if (!snapshot.hasData) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    SizedBox(
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 2),
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(Utils.mainBlue.withOpacity(0.5)),
                                  strokeWidth: 10,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(right: 23),
                              child: const Opacity(
                                opacity: 0.1,
                                child: GCloudLogoAnim(scale: 0.18, colorLogo: true, animate: false)
                                )
                              )
                          ),
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(right: 23),
                              child: const GCloudLogoAnim(scale: 0.18, colorLogo: true))
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const SizedBox(
                      width: 150,
                      child: Text('Loading Future\nCloud Engineers\'\n Badge Data',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Utils.mainBlue)
                      )
                    )
                  ],
                );
              }

              List<BadgeHolder> badgeHolders = snapshot.data as List<BadgeHolder>;
              
              return Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BadgeHolderList(
                    badgeHolders: badgeHolders,
                  ),
                  const SizedBox(width: 30),
                  Center(child: BadgeTracker(
                    badgeHolders: badgeHolders
                  ))
                ],
              );
            }
          )
        ],
      ),
    );
  }
}