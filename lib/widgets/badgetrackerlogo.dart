import 'package:badgetracker/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BadgeTrackerLogo extends StatefulWidget {

  final BadgeTrackerLogos logo;
  final Size size;
  const BadgeTrackerLogo({
    super.key,
    this.size = const Size(100, 100),
    this.logo = BadgeTrackerLogos.googlecloudmono,  
  });

  @override
  State<BadgeTrackerLogo> createState() => _BadgeTrackerLogoState();
}

class _BadgeTrackerLogoState extends State<BadgeTrackerLogo> {

  late RiveAnimation anim;
  late StateMachineController ctrl;

  @override  
  void initState() {
    super.initState();

    anim = RiveAnimation.asset('./assets/anims/duupr_logos.riv',
      artboard: widget.logo.name,
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(Artboard ab) {
    ctrl = StateMachineController.fromArtboard(ab, widget.logo.name)!;
    ab.addController(ctrl);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: anim,
    );
  }
}