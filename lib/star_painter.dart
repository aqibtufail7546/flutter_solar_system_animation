import 'package:flutter/material.dart';
import 'dart:math' as math;

class StarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    final random = math.Random(42);

    for (int i = 0; i < 500; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 1.5;

      paint.color = Colors.white.withOpacity(random.nextDouble() * 0.8 + 0.2);

      canvas.drawCircle(Offset(x, y), radius, paint);
    }

    // A few colored stars
    final colors = [
      Colors.red.shade300,
      Colors.blue.shade300,
      Colors.yellow.shade300,
      Colors.orange.shade300,
    ];

    for (int i = 0; i < 20; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 2 + 0.5;
      final colorIndex = random.nextInt(colors.length);

      paint.color =
          colors[colorIndex].withOpacity(random.nextDouble() * 0.7 + 0.3);

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
