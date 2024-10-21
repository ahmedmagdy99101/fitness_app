import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

Widget bulidTimer(CountDownController controller){
  return  NeonCircularTimer(
    width: 120,
    duration: 40,
    autoStart: false,
    controller: controller,
    isTimerTextShown: true,
    neumorphicEffect: true,
    innerFillGradient: const LinearGradient(colors: [
      Colors.black,
      Colors.black
    ]),
    neonGradient: const LinearGradient(colors: [
      Colors.white,
      Colors.black,
    ]),
  );
}