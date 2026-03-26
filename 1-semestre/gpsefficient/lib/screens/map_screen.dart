import 'package:flutter/material.dart';
import '../widgets/fake_map_painter.dart';
import '../widgets/route_bottom_panel.dart';
import '../widgets/eco_meter.dart';
import '../widgets/vehicle_chip.dart';
import '../widgets/navigation_header.dart';
import '../widgets/map_action_buttons.dart';

/// Main map screen composing all floating UI elements over a full-screen fake map.
/// Supports idle (route comparison) and navigating modes.
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with SingleTickerProviderStateMixin {
  bool _isNavigating = false;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _toggleNavigation() {
    setState(() {
      _isNavigating = !_isNavigating;
    });
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: Stack(
        children: [
          // ========== FULL-SCREEN FAKE MAP ==========
          Positioned.fill(
            child: CustomPaint(
              painter: FakeMapPainter(showNavigating: _isNavigating),
              size: Size.infinite,
            ),
          ),

          // ========== TOP: Search bar / Navigation header ==========
          Positioned(
            top: topPadding + 8,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: NavigationHeader(
                key: ValueKey(_isNavigating),
                isNavigating: _isNavigating,
              ),
            ),
          ),

          // ========== VEHICLE CHIP ==========
          Positioned(
            top: topPadding + (_isNavigating ? 100 : 70),
            left: 16,
            child: AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 300),
              child: const VehicleChip(),
            ),
          ),

          // ========== ECO-METER (right side) ==========
          Positioned(
            right: 12,
            top: topPadding + (_isNavigating ? 110 : 80),
            child: AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _isNavigating ? _pulseAnimation.value : 1.0,
                  child: child,
                );
              },
              child: EcoMeter(
                value: _isNavigating ? 0.78 : 0.78,
                isNavigating: _isNavigating,
              ),
            ),
          ),

          // ========== MAP ACTION BUTTONS (right side, middle) ==========
          Positioned(
            right: 12,
            bottom: _isNavigating ? (bottomPadding + 220) : (bottomPadding + 340),
            child: const MapActionButtons(),
          ),

          // ========== BOTTOM: Route Panel ==========
          Positioned(
            bottom: bottomPadding,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              child: RouteBottomPanel(
                key: ValueKey(_isNavigating),
                isNavigating: _isNavigating,
                onStartNavigation: _toggleNavigation,
              ),
            ),
          ),

          // ========== NAVIGATING: Stop button ==========
          if (_isNavigating)
            Positioned(
              bottom: bottomPadding + 12,
              right: 24,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _toggleNavigation,
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE53935),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.close, color: Colors.white, size: 18),
                        SizedBox(width: 6),
                        Text(
                          'Parar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          // ========== MOVE BRASIL WATERMARK (subtle) ==========
          Positioned(
            top: topPadding + (_isNavigating ? 100 : 72),
            right: 86,
            child: AnimatedOpacity(
              opacity: _isNavigating ? 0.0 : 0.7,
              duration: const Duration(milliseconds: 300),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'MOVE BRASIL',
                  style: TextStyle(
                    fontSize: 7,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0A3D7A),
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
