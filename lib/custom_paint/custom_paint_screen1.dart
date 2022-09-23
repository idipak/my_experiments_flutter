import 'package:flutter/material.dart';
import 'dart:math';

class CustomPaintScreen1 extends StatelessWidget {
  const CustomPaintScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: CustomPaint(
            size: Size.infinite,
            painter: ProfileCardPainter(color: Colors.red, avatarRadius: 25),
          ),
        ),
      ),
    );
  }
}


class ProfileCardPainter extends CustomPainter{
  ProfileCardPainter({required this.color, required this.avatarRadius});
  final Color color;
  final double avatarRadius;

  @override
  void paint(Canvas canvas, Size size) {

    final shapeBound = Rect.fromLTWH(0, 0, size.width, size.height - avatarRadius);

    final centerAvatar = Offset(shapeBound.center.dx, shapeBound.bottom);

    final avatarBounds = Rect.fromCircle(center: centerAvatar, radius: avatarRadius).inflate(10);

    // _drawBackground(canvas, shapeBound, avatarBounds);

    final curvedShapeBounds = Rect.fromLTWH(shapeBound.left, shapeBound.top + shapeBound.height * 0.35, shapeBound.right, shapeBound.bottom);

    _drawCurvedShape(canvas, curvedShapeBounds, avatarBounds);

  }

  @override
  bool shouldRepaint(ProfileCardPainter oldDelegate) {
    return color != oldDelegate.color;
  }

  void _drawBackground(Canvas canvas, Rect shapeBound, Rect avatarBound){
    final paint = Paint()..color = color;

    final backgroundPath = Path()
      ..moveTo(shapeBound.left, shapeBound.top)
      ..lineTo(shapeBound.bottomLeft.dx, shapeBound.bottomLeft.dy)
      ..arcTo(shapeBound, -pi, pi, false)
      ..lineTo(shapeBound.bottomRight.dx, shapeBound.bottomRight.dy)
      ..lineTo(shapeBound.topRight.dx, shapeBound.topRight.dy)
      ..close();

    canvas.drawPath(backgroundPath, paint);
  }

  void _drawCurvedShape(Canvas canvas, Rect bounds, Rect avatarBounds){
    final colors = [Colors.blue, color, Colors.blue];
    final stops = [0.0, 0.3, 1.0];
    final gradient = LinearGradient(colors: colors, stops: stops);

    final paint = Paint()..color = color
      ..shader = gradient.createShader(bounds);

    final handlePoint = Offset(bounds.left + (bounds.width * 0.25), bounds.top);

    final curvePath = Path()
      ..moveTo(bounds.bottomLeft.dx, bounds.bottomLeft.dy)
      ..arcTo(avatarBounds, -pi, pi, false)
      ..lineTo(bounds.bottomRight.dx, bounds.bottomRight.dy)
      ..lineTo(bounds.topRight.dx, bounds.topRight.dy)
      ..quadraticBezierTo(handlePoint.dx, handlePoint.dy, bounds.bottomLeft.dx, bounds.bottomLeft.dy)
      ..close();

    canvas.drawPath(curvePath, paint);
  }

}

