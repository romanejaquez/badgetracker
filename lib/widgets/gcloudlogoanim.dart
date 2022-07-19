import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GCloudLogoAnim extends StatefulWidget {

  final bool animate;
  const GCloudLogoAnim({Key? key, this.animate = true }) : super(key: key);

  @override
  State<GCloudLogoAnim> createState() => _GCloudLogoAnimState();
}

class _GCloudLogoAnimState extends State<GCloudLogoAnim> with SingleTickerProviderStateMixin {
  
  late AnimationController logoAnim;

  @override
  void initState() {
    super.initState();

    logoAnim = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1)
    );

    if (widget.animate) {
      logoAnim.forward();
    }
    else {
      logoAnim.animateTo(1.0, duration: const Duration(seconds: 0));
    }
  }

  @override
  Widget build(BuildContext context) {

    bool isReversed = false;

    if (widget.animate) {
      Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (!isReversed) {
        logoAnim.reverse();
      }
      else {
        logoAnim.forward();
      }

      isReversed = !isReversed;
    });
    }

    return Transform.scale(
      scale: 0.3,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -82,
              left: -12,
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0)
                  .animate(CurvedAnimation(parent: logoAnim,
                  curve: const Interval(0.75, 1.0, curve: Curves.easeInOut)
                )),
                child: SvgPicture.asset('assets/imgs/gcloud4.svg'))
            ),
            Positioned(
              top: -52.5,
              right: -190,
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0)
                  .animate(CurvedAnimation(parent: logoAnim,
                  curve: const Interval(0.50, 0.75, curve: Curves.easeInOut)
                )),
                child: SvgPicture.asset('assets/imgs/gcloud3.svg'))),
            Positioned(
              bottom: -95,
              left: -15,
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0)
                  .animate(CurvedAnimation(parent: logoAnim,
                  curve: const Interval(0.25, 0.50, curve: Curves.easeInOut)
                )),
                child: SvgPicture.asset('assets/imgs/gcloud2.svg'))),
            Positioned(
              left: -50,
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0)
                  .animate(CurvedAnimation(parent: logoAnim,
                  curve: const Interval(0.0, 0.25, curve: Curves.easeInOut)
                )),
                child: SvgPicture.asset(
                  'assets/imgs/gcloud1.svg'),
              )),
          ],
        ),
      ),
    );
  }
}