import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Custom painter that draws a realistic fake map background
/// with terrain, roads, city blocks, labels, and route lines.
class FakeMapPainter extends CustomPainter {
  final bool showNavigating;

  FakeMapPainter({this.showNavigating = false});

  @override
  void paint(Canvas canvas, Size size) {
    _drawTerrain(canvas, size);
    _drawWater(canvas, size);
    _drawSecondaryRoads(canvas, size);
    _drawMainRoads(canvas, size);
    _drawCityBlocks(canvas, size);
    _drawRouteLines(canvas, size);
    _drawMarkers(canvas, size);
    _drawLabels(canvas, size);
  }

  void _drawTerrain(Canvas canvas, Size size) {
    // Base terrain - light green/beige
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = const Color(0xFFE8E4D8),
    );

    // Green areas (parks, forests)
    final greenAreas = [
      Rect.fromLTWH(0, 0, size.width * 0.3, size.height * 0.15),
      Rect.fromLTWH(size.width * 0.7, size.height * 0.05, size.width * 0.3, size.height * 0.12),
      Rect.fromLTWH(0, size.height * 0.35, size.width * 0.2, size.height * 0.15),
      Rect.fromLTWH(size.width * 0.55, size.height * 0.6, size.width * 0.25, size.height * 0.1),
      Rect.fromLTWH(size.width * 0.1, size.height * 0.75, size.width * 0.15, size.height * 0.12),
      Rect.fromLTWH(size.width * 0.75, size.height * 0.8, size.width * 0.25, size.height * 0.2),
      Rect.fromLTWH(size.width * 0.4, size.height * 0.15, size.width * 0.12, size.height * 0.08),
    ];

    for (final rect in greenAreas) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(8)),
        Paint()..color = const Color(0xFFC5E1A5).withOpacity(0.6),
      );
    }

    // Lighter patches
    final lightPatches = [
      Rect.fromLTWH(size.width * 0.15, size.height * 0.2, size.width * 0.2, size.height * 0.08),
      Rect.fromLTWH(size.width * 0.6, size.height * 0.35, size.width * 0.15, size.height * 0.1),
      Rect.fromLTWH(size.width * 0.3, size.height * 0.85, size.width * 0.2, size.height * 0.08),
    ];
    for (final rect in lightPatches) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(12)),
        Paint()..color = const Color(0xFFDCEDC8).withOpacity(0.4),
      );
    }
  }

  void _drawWater(Canvas canvas, Size size) {
    final waterPaint = Paint()..color = const Color(0xFFB3D9F2).withOpacity(0.7);

    // River-like curves
    final riverPath = Path()
      ..moveTo(size.width * 0.0, size.height * 0.28)
      ..quadraticBezierTo(
        size.width * 0.15, size.height * 0.30,
        size.width * 0.25, size.height * 0.26,
      )
      ..quadraticBezierTo(
        size.width * 0.35, size.height * 0.22,
        size.width * 0.5, size.height * 0.25,
      )
      ..quadraticBezierTo(
        size.width * 0.65, size.height * 0.28,
        size.width * 0.7, size.height * 0.22,
      );

    canvas.drawPath(
      riverPath,
      Paint()
        ..color = const Color(0xFFB3D9F2).withOpacity(0.8)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round,
    );

    // Small lake
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.82, size.height * 0.18),
        width: size.width * 0.08,
        height: size.height * 0.04,
      ),
      waterPaint,
    );
  }

  void _drawSecondaryRoads(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = const Color(0xFFFFFFFF).withOpacity(0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    // Grid of secondary roads
    final secondaryRoads = [
      [Offset(0, size.height * 0.12), Offset(size.width, size.height * 0.14)],
      [Offset(0, size.height * 0.45), Offset(size.width * 0.5, size.height * 0.42)],
      [Offset(size.width * 0.5, size.height * 0.42), Offset(size.width, size.height * 0.48)],
      [Offset(0, size.height * 0.65), Offset(size.width * 0.4, size.height * 0.62)],
      [Offset(size.width * 0.4, size.height * 0.62), Offset(size.width, size.height * 0.68)],
      [Offset(0, size.height * 0.88), Offset(size.width, size.height * 0.85)],
      [Offset(size.width * 0.12, 0), Offset(size.width * 0.15, size.height)],
      [Offset(size.width * 0.35, 0), Offset(size.width * 0.33, size.height)],
      [Offset(size.width * 0.55, 0), Offset(size.width * 0.58, size.height)],
      [Offset(size.width * 0.78, 0), Offset(size.width * 0.75, size.height)],
      [Offset(size.width * 0.92, 0), Offset(size.width * 0.90, size.height)],
    ];

    for (final road in secondaryRoads) {
      canvas.drawLine(road[0], road[1], roadPaint);
    }
  }

  void _drawMainRoads(Canvas canvas, Size size) {
    final mainRoadPaint = Paint()
      ..color = const Color(0xFFFFF9C4).withOpacity(0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final mainRoadOutline = Paint()
      ..color = const Color(0xFFE0C964).withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;

    // SP-270 (horizontal highway)
    final hw1 = Path()
      ..moveTo(0, size.height * 0.58)
      ..quadraticBezierTo(
        size.width * 0.3, size.height * 0.55,
        size.width * 0.5, size.height * 0.52,
      )
      ..quadraticBezierTo(
        size.width * 0.7, size.height * 0.49,
        size.width, size.height * 0.53,
      );
    canvas.drawPath(hw1, mainRoadOutline);
    canvas.drawPath(hw1, mainRoadPaint);

    // BR-381 (diagonal road)
    final hw2 = Path()
      ..moveTo(size.width * 0.2, size.height)
      ..quadraticBezierTo(
        size.width * 0.35, size.height * 0.7,
        size.width * 0.5, size.height * 0.52,
      )
      ..quadraticBezierTo(
        size.width * 0.65, size.height * 0.35,
        size.width * 0.8, 0,
      );
    canvas.drawPath(hw2, mainRoadOutline);
    canvas.drawPath(hw2, mainRoadPaint);
  }

  void _drawCityBlocks(Canvas canvas, Size size) {
    final blockPaint = Paint()..color = const Color(0xFFD7CFC2).withOpacity(0.5);

    // Sorocaba area blocks
    final sorocabaBlocks = [
      Rect.fromLTWH(size.width * 0.06, size.height * 0.72, size.width * 0.06, size.height * 0.03),
      Rect.fromLTWH(size.width * 0.14, size.height * 0.71, size.width * 0.05, size.height * 0.04),
      Rect.fromLTWH(size.width * 0.08, size.height * 0.77, size.width * 0.07, size.height * 0.03),
      Rect.fromLTWH(size.width * 0.17, size.height * 0.76, size.width * 0.04, size.height * 0.035),
      Rect.fromLTWH(size.width * 0.22, size.height * 0.73, size.width * 0.05, size.height * 0.03),
    ];
    for (final block in sorocabaBlocks) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(block, const Radius.circular(2)),
        blockPaint,
      );
    }

    // Poços de Caldas area blocks
    final pocosBlocks = [
      Rect.fromLTWH(size.width * 0.68, size.height * 0.13, size.width * 0.05, size.height * 0.025),
      Rect.fromLTWH(size.width * 0.74, size.height * 0.12, size.width * 0.04, size.height * 0.035),
      Rect.fromLTWH(size.width * 0.70, size.height * 0.17, size.width * 0.06, size.height * 0.025),
      Rect.fromLTWH(size.width * 0.77, size.height * 0.16, size.width * 0.04, size.height * 0.03),
    ];
    for (final block in pocosBlocks) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(block, const Radius.circular(2)),
        blockPaint,
      );
    }

    // Scattered city blocks
    final otherBlocks = [
      Rect.fromLTWH(size.width * 0.42, size.height * 0.48, size.width * 0.04, size.height * 0.025),
      Rect.fromLTWH(size.width * 0.47, size.height * 0.47, size.width * 0.035, size.height * 0.03),
      Rect.fromLTWH(size.width * 0.30, size.height * 0.58, size.width * 0.04, size.height * 0.02),
    ];
    for (final block in otherBlocks) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(block, const Radius.circular(2)),
        blockPaint,
      );
    }
  }

  void _drawRouteLines(Canvas canvas, Size size) {
    // ---- Standard route (grey/blue dashed) ----
    final standardRoutePaint = Paint()
      ..color = const Color(0xFF90A4AE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final standardRoute = Path()
      ..moveTo(size.width * 0.15, size.height * 0.75)
      ..quadraticBezierTo(
        size.width * 0.20, size.height * 0.65,
        size.width * 0.30, size.height * 0.55,
      )
      ..quadraticBezierTo(
        size.width * 0.40, size.height * 0.45,
        size.width * 0.50, size.height * 0.38,
      )
      ..quadraticBezierTo(
        size.width * 0.60, size.height * 0.30,
        size.width * 0.72, size.height * 0.18,
      );

    // Dashed effect for standard route
    final standardMetrics = standardRoute.computeMetrics();
    for (final metric in standardMetrics) {
      double distance = 0;
      while (distance < metric.length) {
        final end = (distance + 12).clamp(0, metric.length);
        final segment = metric.extractPath(distance, end.toDouble());
        canvas.drawPath(segment, standardRoutePaint);
        distance += 20;
      }
    }

    // ---- MOVE BRASIL eco route (green, solid, prominent) ----
    // Outer glow
    final ecoGlowPaint = Paint()
      ..color = const Color(0xFF66BB6A).withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;

    final ecoRoute = Path()
      ..moveTo(size.width * 0.15, size.height * 0.75)
      ..quadraticBezierTo(
        size.width * 0.12, size.height * 0.68,
        size.width * 0.18, size.height * 0.58,
      )
      ..quadraticBezierTo(
        size.width * 0.25, size.height * 0.48,
        size.width * 0.35, size.height * 0.42,
      )
      ..quadraticBezierTo(
        size.width * 0.48, size.height * 0.35,
        size.width * 0.55, size.height * 0.30,
      )
      ..quadraticBezierTo(
        size.width * 0.62, size.height * 0.25,
        size.width * 0.65, size.height * 0.22,
      )
      ..quadraticBezierTo(
        size.width * 0.68, size.height * 0.19,
        size.width * 0.72, size.height * 0.18,
      );

    canvas.drawPath(ecoRoute, ecoGlowPaint);

    final ecoRoutePaint = Paint()
      ..color = const Color(0xFF43A047)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(ecoRoute, ecoRoutePaint);

    // Animated arrow direction indicators on eco route
    if (showNavigating) {
      final arrowPaint = Paint()
        ..color = Colors.white.withOpacity(0.9)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round;

      final metrics = ecoRoute.computeMetrics();
      for (final metric in metrics) {
        for (double d = 30; d < metric.length; d += 60) {
          final tangent = metric.getTangentForOffset(d);
          if (tangent != null) {
            final pos = tangent.position;
            final angle = tangent.angle;
            final arrowSize = 6.0;
            canvas.drawLine(
              Offset(
                pos.dx - arrowSize * math.cos(angle - 0.5),
                pos.dy - arrowSize * math.sin(angle - 0.5),
              ),
              pos,
              arrowPaint,
            );
            canvas.drawLine(
              Offset(
                pos.dx - arrowSize * math.cos(angle + 0.5),
                pos.dy - arrowSize * math.sin(angle + 0.5),
              ),
              pos,
              arrowPaint,
            );
          }
        }
      }
    }
  }

  void _drawMarkers(Canvas canvas, Size size) {
    // Point A — Sorocaba
    _drawMapPin(
      canvas,
      Offset(size.width * 0.15, size.height * 0.75),
      const Color(0xFF1565C0),
      'A',
    );

    // Point B — Poços de Caldas
    _drawMapPin(
      canvas,
      Offset(size.width * 0.72, size.height * 0.18),
      const Color(0xFF43A047),
      'B',
    );

    // Vehicle indicator (truck icon) on eco route
    if (showNavigating) {
      final truckPos = Offset(size.width * 0.35, size.height * 0.42);
      canvas.drawCircle(
        truckPos,
        16,
        Paint()..color = const Color(0xFF1565C0),
      );
      canvas.drawCircle(
        truckPos,
        14,
        Paint()..color = const Color(0xFF42A5F5),
      );
      canvas.drawCircle(
        truckPos,
        6,
        Paint()..color = Colors.white,
      );
      // Accuracy circle
      canvas.drawCircle(
        truckPos,
        28,
        Paint()
          ..color = const Color(0xFF42A5F5).withOpacity(0.15)
          ..style = PaintingStyle.fill,
      );
    }
  }

  void _drawMapPin(Canvas canvas, Offset pos, Color color, String label) {
    // Shadow
    canvas.drawCircle(
      Offset(pos.dx + 1, pos.dy + 2),
      14,
      Paint()..color = Colors.black.withOpacity(0.2),
    );

    // Pin circle
    canvas.drawCircle(pos, 14, Paint()..color = color);
    canvas.drawCircle(pos, 11, Paint()..color = Colors.white);
    canvas.drawCircle(pos, 8, Paint()..color = color);

    // Label
    final textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(
      canvas,
      Offset(pos.dx - textPainter.width / 2, pos.dy - textPainter.height / 2),
    );
  }

  void _drawLabels(Canvas canvas, Size size) {
    // City labels
    _drawCityLabel(canvas, Offset(size.width * 0.08, size.height * 0.70), 'Sorocaba', true);
    _drawCityLabel(canvas, Offset(size.width * 0.65, size.height * 0.11), 'Poços de Caldas', true);
    _drawCityLabel(canvas, Offset(size.width * 0.38, size.height * 0.44), 'Itapetininga', false);
    _drawCityLabel(canvas, Offset(size.width * 0.52, size.height * 0.33), 'Águas de Lindóia', false);

    // Highway labels
    _drawHighwayLabel(canvas, Offset(size.width * 0.60, size.height * 0.54), 'SP-270');
    _drawHighwayLabel(canvas, Offset(size.width * 0.55, size.height * 0.40), 'BR-381');

    // Route labels
    _drawRouteLabel(
      canvas,
      Offset(size.width * 0.22, size.height * 0.55),
      'Rota Eco',
      const Color(0xFF43A047),
    );
    _drawRouteLabel(
      canvas,
      Offset(size.width * 0.42, size.height * 0.37),
      'Rota Padrão',
      const Color(0xFF78909C),
    );
  }

  void _drawCityLabel(Canvas canvas, Offset pos, String name, bool isPrimary) {
    final bgPaint = Paint()..color = Colors.white.withOpacity(isPrimary ? 0.92 : 0.75);
    final textPainter = TextPainter(
      text: TextSpan(
        text: name,
        style: TextStyle(
          color: isPrimary ? Colors.black87 : Colors.black54,
          fontSize: isPrimary ? 13 : 10,
          fontWeight: isPrimary ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final bgRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(pos.dx - 4, pos.dy - 2, textPainter.width + 8, textPainter.height + 4),
      const Radius.circular(4),
    );
    canvas.drawRRect(bgRect, bgPaint);
    textPainter.paint(canvas, pos);
  }

  void _drawHighwayLabel(Canvas canvas, Offset pos, String name) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: name,
        style: const TextStyle(
          color: Color(0xFF5D4037),
          fontSize: 9,
          fontWeight: FontWeight.w700,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final bgRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(pos.dx - 4, pos.dy - 2, textPainter.width + 8, textPainter.height + 4),
      const Radius.circular(3),
    );
    canvas.drawRRect(bgRect, Paint()..color = const Color(0xFFFFF9C4).withOpacity(0.9));
    canvas.drawRRect(
      bgRect,
      Paint()
        ..color = const Color(0xFFE0C964)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
    textPainter.paint(canvas, pos);
  }

  void _drawRouteLabel(Canvas canvas, Offset pos, String label, Color color) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.w700,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final bgRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(pos.dx - 6, pos.dy - 3, textPainter.width + 12, textPainter.height + 6),
      const Radius.circular(10),
    );
    canvas.drawRRect(bgRect, Paint()..color = color.withOpacity(0.85));
    textPainter.paint(canvas, pos);
  }

  @override
  bool shouldRepaint(covariant FakeMapPainter oldDelegate) {
    return oldDelegate.showNavigating != showNavigating;
  }
}
