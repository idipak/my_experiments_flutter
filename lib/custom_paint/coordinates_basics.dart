import 'package:flutter/material.dart';

class CoordinatesBasics extends StatelessWidget {
  const CoordinatesBasics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey,
          height: 200,
          width: 200,
          child: CustomPaint(
            painter: CoordinatePainter(),
            // size: const Size.square(200),
          ),
        ),
      ),
    );
  }
}

class CoordinatePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    const topLeft = Offset(0, 0);
    final bottomLeft = Offset(0, size.height);
    final topRight = Offset(size.width, 0);
    final bottomRight = Offset(size.width, size.height);
    final center = Offset(size.width / 2, size.height / 2);

    final painter1 = Paint()
    ..strokeWidth = 10
      ..color = Colors.cyan;

    final painter2 = Paint()
      ..strokeWidth = 10
      ..color = Colors.amberAccent;

    final painter3 = Paint()
      ..strokeWidth = 10
      ..color = Colors.indigo;

    final painter4 = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink;

    final linePainter = Paint()
    ..strokeWidth = 10
    ..color = Colors.white;

    canvas.drawCircle(topLeft, 4, painter1);
    canvas.drawCircle(topRight, 4, painter2);
    canvas.drawCircle(bottomLeft, 4, painter3);
    canvas.drawCircle(bottomRight, 4, painter4);

    // canvas.drawLine(topRight, bottomRight, linePainter);

    // canvas.drawLine(bottomLeft, bottomRight, linePainter);

    canvas.drawRect(Rect.fromCenter(center: center, width: 50, height: 50), painter4);
  }

  @override
  bool shouldRepaint(CoordinatePainter oldDelegate) {
    return true;
  }
}
