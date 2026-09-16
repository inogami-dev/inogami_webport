import 'package:flutter/material.dart';

class MyFloatingAnimation extends StatefulWidget {
  final Widget child;
  final double distance;
  final Duration duration;
  final Duration delay;

  const MyFloatingAnimation({
    super.key,
    required this.child,
    this.distance = 4.0,
    this.duration = const Duration(milliseconds: 3000),
    this.delay = Duration.zero,
  });

  @override
  State<MyFloatingAnimation> createState() => _MyFloatingAnimationState();
}

class _MyFloatingAnimationState extends State<MyFloatingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<double>(
      begin: -widget.distance,
      end: widget.distance,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
