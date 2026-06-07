import 'dart:math';
import 'package:flutter/material.dart';

class TotalSpentCard extends StatelessWidget {
  final double totalSpent;
  final double monthlyChange;

  const TotalSpentCard({
    super.key,
    required this.totalSpent,
    required this.monthlyChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: const Color(0xFF1A2340),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Network pattern background
            Positioned.fill(
              child: CustomPaint(painter: _NetworkPatternPainter()),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Spent',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${totalSpent.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'This Month',
                        style: TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '+${monthlyChange.toInt()}%',
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NetworkPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pointPaint = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final linePaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 0.8;

    // نقاط الشبكة
    final points = [
      Offset(size.width * 0.55, size.height * 0.15),
      Offset(size.width * 0.65, size.height * 0.45),
      Offset(size.width * 0.75, size.height * 0.20),
      Offset(size.width * 0.85, size.height * 0.55),
      Offset(size.width * 0.95, size.height * 0.25),
      Offset(size.width * 0.70, size.height * 0.75),
      Offset(size.width * 0.90, size.height * 0.80),
      Offset(size.width * 0.60, size.height * 0.60),
      Offset(size.width * 0.80, size.height * 0.40),
      Offset(size.width * 1.0, size.height * 0.60),
      Offset(size.width * 0.50, size.height * 0.85),
    ];

    for (int i = 0; i < points.length; i++) {
      for (int j = i + 1; j < points.length; j++) {
        final distance = (points[i] - points[j]).distance;
        if (distance < size.width * 0.28) {
          canvas.drawLine(points[i], points[j], linePaint);
        }
      }
    }

    // ارسمي النقاط
    for (final point in points) {
      canvas.drawCircle(point, 2.5, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
