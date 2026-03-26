import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Circular eco-meter gauge showing current torque efficiency.
/// Green = ideal, Yellow = moderate, Red = high consumption.
class EcoMeter extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final bool isNavigating;

  const EcoMeter({
    super.key,
    this.value = 0.78,
    this.isNavigating = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Gauge
          SizedBox(
            width: 56,
            height: 40,
            child: CustomPaint(
              painter: _EcoGaugePainter(value: value),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${(value * 100).toInt()}%',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: _getColor(value),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'ECO',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w700,
              color: Colors.grey[600],
              letterSpacing: 1.5,
            ),
          ),
          if (isNavigating) ...[
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF43A047).withOpacity(0.12),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'IDEAL',
                style: TextStyle(
                  fontSize: 7,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2E7D32),
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getColor(double v) {
    if (v >= 0.65) return const Color(0xFF43A047);
    if (v >= 0.4) return const Color(0xFFFFA000);
    return const Color(0xFFE53935);
  }
}

class _EcoGaugePainter extends CustomPainter {
  final double value;
  _EcoGaugePainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.85);
    final radius = size.width * 0.42;

    // Background arc
    final bgPaint = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      bgPaint,
    );

    // Gradient arc segments
    final segments = [
      (const Color(0xFFE53935), 0.33),
      (const Color(0xFFFFA000), 0.33),
      (const Color(0xFF43A047), 0.34),
    ];

    double startAngle = math.pi;
    for (final seg in segments) {
      final sweepAngle = math.pi * seg.$2;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        Paint()
          ..color = seg.$1.withOpacity(0.25)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round,
      );
      startAngle += sweepAngle;
    }

    // Value arc
    Color valueColor;
    if (value >= 0.65) {
      valueColor = const Color(0xFF43A047);
    } else if (value >= 0.4) {
      valueColor = const Color(0xFFFFA000);
    } else {
      valueColor = const Color(0xFFE53935);
    }

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi * value,
      false,
      Paint()
        ..color = valueColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..strokeCap = StrokeCap.round,
    );

    // Needle
    final needleAngle = math.pi + math.pi * value;
    final needleEnd = Offset(
      center.dx + (radius - 4) * math.cos(needleAngle),
      center.dy + (radius - 4) * math.sin(needleAngle),
    );
    canvas.drawLine(
      center,
      needleEnd,
      Paint()
        ..color = Colors.black87
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawCircle(center, 3, Paint()..color = Colors.black87);
  }

  @override
  bool shouldRepaint(covariant _EcoGaugePainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
