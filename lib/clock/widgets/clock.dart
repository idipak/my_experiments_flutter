import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPaint(),
        ),
      ),
    );
  }
}

class ClockPaint extends CustomPainter{
  final dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    final fillBrush = Paint()
    ..color = const Color(0xFF444974);

    final outlineBrush = Paint()
    ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
    ..strokeWidth = 16;

    final centerFillBrush = Paint()
      ..color = const Color(0xFFEAECFF);

    final secHandBrush = Paint()
    ..color = Colors.orange.shade300
      ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8;

    final minHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF748EF6)]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 14;

    final hourHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 14;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);

    const hourHandSize = 60;
    final hourHandX = centerX + hourHandSize * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    final hourHandY = centerX + hourHandSize * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    const minHandSize = 80;
    final minHandX = centerX + minHandSize * cos((dateTime.minute * 6) * pi / 180);
    final minHandY = centerX + minHandSize * sin((dateTime.minute * 6) * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    const secHandSize = 80;
    final secHandX = centerX + secHandSize * cos((dateTime.second * 6) * pi / 180); ///60 seconds = 360 degrees => 1 sec = 6 deg
    final secHandY = centerX + secHandSize * sin((dateTime.second * 6) * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);

    final outerCircleRadius = radius;
    final innerCircleRadius = radius - 14;
    final dashBrush = Paint()..color = Colors.white;
    for(double i = 0; i< 360; i+= 12){
      final x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      final y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      final x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      final y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
