import 'package:flutter/material.dart';

/// Floating bottom panel comparing MOVE BRASIL eco-route vs standard route.
/// Mimics the Google Maps route comparison card.
class RouteBottomPanel extends StatelessWidget {
  final bool isNavigating;
  final VoidCallback onStartNavigation;

  const RouteBottomPanel({
    super.key,
    this.isNavigating = false,
    required this.onStartNavigation,
  });

  @override
  Widget build(BuildContext context) {
    if (isNavigating) {
      return _buildNavigatingPanel();
    }
    return _buildRouteComparisonPanel();
  }

  Widget _buildRouteComparisonPanel() {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xF2191C20),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 24,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0D47A1), Color(0xFF1B5E20)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.route, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Sorocaba → Poços de Caldas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 4),

          // === MOVE BRASIL ROUTE (HIGHLIGHTED) ===
          _buildEcoRoute(),

          // Divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Divider(color: Colors.white.withOpacity(0.08), height: 1),
          ),

          // === STANDARD ROUTE ===
          _buildStandardRoute(),

          const SizedBox(height: 8),

          // Start button
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 4, 18, 16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: onStartNavigation,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF43A047),
                        Color(0xFF66BB6A),
                        Color(0xFFAED581),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.navigation, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Iniciar Rota Eco',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEcoRoute() {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1B5E20).withOpacity(0.25),
            const Color(0xFF43A047).withOpacity(0.10),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF43A047).withOpacity(0.4),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF43A047), Color(0xFF66BB6A)],
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.eco, color: Colors.white, size: 12),
                    SizedBox(width: 4),
                    Text(
                      'MOVE BRASIL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFB9F6CA).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'RECOMENDADA',
                  style: TextStyle(
                    color: Color(0xFF69F0AE),
                    fontSize: 8,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildMetric('3h 12min', 'Tempo', const Color(0xFFE0E0E0)),
              const SizedBox(width: 16),
              _buildMetric('198 km', 'Distância', const Color(0xFFE0E0E0)),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildHighlight('−18%', 'diesel', const Color(0xFF69F0AE)),
              const SizedBox(width: 20),
              _buildHighlight('−8.5 kg', 'CO₂', const Color(0xFFB9F6CA)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStandardRoute() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF78909C),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rota Padrão',
                  style: TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '2h 55min · 182 km',
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Consumo maior',
                style: TextStyle(
                  color: Colors.orange[300],
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                '+18% diesel',
                style: TextStyle(
                  color: Color(0xFF757575),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavigatingPanel() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xF2191C20),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.30),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.35,
              backgroundColor: Colors.white.withOpacity(0.1),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF43A047)),
              minHeight: 4,
            ),
          ),
          const SizedBox(height: 14),
          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavStat('2h 05min', 'Restante', Icons.access_time),
              _buildNavStatHighlight('142 km', 'Faltam', Icons.straighten),
              _buildNavStat('17:02', 'Chegada', Icons.flag),
            ],
          ),
          const SizedBox(height: 14),
          // Eco savings
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF1B5E20).withOpacity(0.3),
                  const Color(0xFF43A047).withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.eco, color: Color(0xFF69F0AE), size: 18),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Operando na faixa ideal de torque',
                    style: TextStyle(
                      color: Color(0xFFB9F6CA),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFF69F0AE).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    '−3.2 L',
                    style: TextStyle(
                      color: Color(0xFF69F0AE),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(String value, String label, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: color.withOpacity(0.5),
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildHighlight(String value, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: color.withOpacity(0.6),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildNavStat(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white54, size: 16),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.4),
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildNavStatHighlight(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF69F0AE), size: 16),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF69F0AE),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF69F0AE).withOpacity(0.5),
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
