import 'package:flutter/material.dart';
import 'dart:math' as math;

class AsteroidBeltPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final random = math.Random(123);

    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    // Draw asteroids between Mars and Jupiter
    for (int i = 0; i < 200; i++) {
      final angle = random.nextDouble() * 2 * math.pi;
      final distance = 320 + random.nextDouble() * 60;
      final size = random.nextDouble() * 2 + 0.5;

      final x = center.dx + math.cos(angle) * distance;
      final y = center.dy + math.sin(angle) * distance;

      canvas.drawCircle(Offset(x, y), size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
