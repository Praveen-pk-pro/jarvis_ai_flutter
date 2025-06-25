import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HudBackground extends StatelessWidget {
  const HudBackground({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Lottie.asset('assets/animations/jarvis.json', fit: BoxFit.cover),
    );
  }
}
