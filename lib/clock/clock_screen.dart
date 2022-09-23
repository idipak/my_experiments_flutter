import 'package:flutter/material.dart';
import 'package:my_experiments/clock/widgets/clock.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xFF2D2F41),
        child: const ClockView(),
      ),
    );
  }
}
