import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  final Widget child;
  final double verticalOffset;
  final int durationMs;

  const MyAnimation({
    super.key,
    required this.child,
    this.verticalOffset = 50.0, // Starts 50 pixels lower
    this.durationMs = 800,
  });

  @override
  State<MyAnimation> createState() => _MyAnimationWidgetState();
}

class _MyAnimationWidgetState extends State<MyAnimation> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Wait until the first frame is fully drawn, then trigger the animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _isVisible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Smoothly morphs custom value from 0.0 to 1.0
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: (_isVisible) ? 1.0 : 0.0),
      duration: Duration(milliseconds: widget.durationMs),
      curve: Curves.easeOutBack, // The subtle bounce effect
      builder: (context, value, child) {
        return Opacity(
          // Clamp prevents opacity from going below 0.0 or above 1.0 during the bounce
          opacity: value.clamp(0.0, 1.0),

          // Slides the widget upward visually without breaking layout bounds
          child: Transform.translate(
            offset: Offset(0, widget.verticalOffset * (1 - value)),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
