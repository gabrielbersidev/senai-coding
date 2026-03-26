import 'package:flutter/material.dart';

/// Floating action buttons for map interactions: center, layers.
class MapActionButtons extends StatelessWidget {
  const MapActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Layers button
        _buildButton(
          icon: Icons.layers_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 10),
        // Center / GPS button
        _buildButton(
          icon: Icons.my_location,
          onTap: () {},
          isPrimary: true,
        ),
      ],
    );
  }

  Widget _buildButton({
    required IconData icon,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: isPrimary ? Colors.white : Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: isPrimary ? const Color(0xFF1565C0) : Colors.grey[700],
            size: 22,
          ),
        ),
      ),
    );
  }
}
