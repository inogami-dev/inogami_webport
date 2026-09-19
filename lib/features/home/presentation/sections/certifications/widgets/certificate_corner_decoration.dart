import 'package:flutter/material.dart';

class MyCertificateCornerDecoration extends StatelessWidget {
  final Widget child;

  /// Size of the corner tabs in pixels
  final double cornerSize;

  /// Color of the photo corners
  final Color? cornerColor;

  const MyCertificateCornerDecoration({
    super.key,
    required this.child,
    this.cornerSize = 28.0,
    this.cornerColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = cornerColor ?? theme.colorScheme.primary;
    const double overHang = -2;

    return Stack(
      // 1. Fit loose so the Stack shrink-wraps tightly to the child image
      fit: StackFit.loose,
      clipBehavior: Clip.none,
      children: [
        // 2. The main image (NOT inside Positioned!) determines the exact bounds
        child,

        // Top-Left Corner
        Positioned(
          top: overHang,
          left: overHang,
          child: _PhotoCorner(
            size: cornerSize,
            color: color,
            position: CornerPosition.topLeft,
          ),
        ),

        // Top-Right Corner
        Positioned(
          top: overHang,
          right: overHang,
          child: _PhotoCorner(
            size: cornerSize,
            color: color,
            position: CornerPosition.topRight,
          ),
        ),

        // Bottom-Left Corner
        Positioned(
          bottom: overHang,
          left: overHang,
          child: _PhotoCorner(
            size: cornerSize,
            color: color,
            position: CornerPosition.bottomLeft,
          ),
        ),

        // Bottom-Right Corner
        Positioned(
          bottom: overHang,
          right: overHang,
          child: _PhotoCorner(
            size: cornerSize,
            color: color,
            position: CornerPosition.bottomRight,
          ),
        ),
      ],
    );
  }
}

enum CornerPosition { topLeft, topRight, bottomLeft, bottomRight }

/// Paints an authentic triangular photo mounting pocket with subtle depth
class _PhotoCorner extends StatelessWidget {
  final double size;
  final Color color;
  final CornerPosition position;

  const _PhotoCorner({
    required this.size,
    required this.color,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _TriangleCornerPainter(color: color, position: position),
    );
  }
}

class _TriangleCornerPainter extends CustomPainter {
  final Color color;
  final CornerPosition position;

  _TriangleCornerPainter({required this.color, required this.position});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Subtle dark border to simulate paper edge depth
    final borderPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.25)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();

    switch (position) {
      case CornerPosition.topLeft:
        path.moveTo(0, 0);
        path.lineTo(size.width, 0);
        path.lineTo(0, size.height);
        break;
      case CornerPosition.topRight:
        path.moveTo(size.width, 0);
        path.lineTo(0, 0);
        path.lineTo(size.width, size.height);
        break;
      case CornerPosition.bottomLeft:
        path.moveTo(0, size.height);
        path.lineTo(0, 0);
        path.lineTo(size.width, size.height);
        break;
      case CornerPosition.bottomRight:
        path.moveTo(size.width, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(0, size.height);
        break;
    }
    path.close();

    // Draw shadow underneath the tab
    canvas.drawShadow(path, Colors.black.withValues(alpha: 0.5), 3.0, false);
    // Draw the corner tab
    canvas.drawPath(path, paint);
    // Draw the paper crease edge
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _TriangleCornerPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.position != position;
}
