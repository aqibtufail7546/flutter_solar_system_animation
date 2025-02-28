import 'package:flutter/material.dart';

class RingsPainter extends CustomPainter {
  final Color color;
  final double inner;
  final double outer;

  RingsPainter({
    required this.color,
    required this.inner,
    required this.outer,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final innerRadius = radius * inner;
    final outerRadius = radius * outer;

    // Draw the rings as ovals to give a 3D effect
    for (double r = innerRadius; r <= outerRadius; r += 1) {
      canvas.drawOval(
        Rect.fromCenter(
          center: center,
          width: r * 2,
          height: r * 0.4,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
