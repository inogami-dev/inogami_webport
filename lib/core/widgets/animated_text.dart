import 'dart:async';
import 'package:flutter/material.dart';

class MyAnimatedText extends StatefulWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final List<Color>? colors;
  final List<double>? stops;
  final TextDirection textDirection;
  final int delayBetweenAnimationsInMillis;
  final int animationSpeedInMillis;
  final bool repeatForever;
  final double? lineHeight;

  const MyAnimatedText({
    super.key,
    required this.text,
    this.fontFamily = "Poppins",
    this.fontSize = 14,
    this.fontWeight = FontWeight.bold,
    this.colors,
    this.stops,
    this.textDirection = TextDirection.ltr,
    this.delayBetweenAnimationsInMillis = 400,
    this.animationSpeedInMillis = 3000,
    this.repeatForever = true,
    this.lineHeight,
  });

  @override
  State<MyAnimatedText> createState() => _MyAnimatedTextState();
}

class _MyAnimatedTextState extends State<MyAnimatedText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  List<Color> get _effectiveColors {
    if (widget.colors != null) return widget.colors!;
    return [
      Colors.white,
      Colors.blue.shade200,
      Colors.blue.shade100,
      Colors.white,
    ];
  }

  List<double> get _effectiveStops {
    if (widget.stops != null) return widget.stops!;
    final int count = _effectiveColors.length;
    if (count <= 1) return [0.0];
    return List.generate(count, (i) => i / (count - 1));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationSpeedInMillis),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (!widget.repeatForever) return;
        if (widget.delayBetweenAnimationsInMillis > 0) {
          Future.delayed(
            Duration(milliseconds: widget.delayBetweenAnimationsInMillis),
            () {
              if (mounted) {
                _controller.forward(from: 0.0);
              }
            },
          );
        } else {
          _controller.forward(from: 0.0);
        }
      }
    });

    _controller.forward();
  }

  @override
  void didUpdateWidget(MyAnimatedText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animationSpeedInMillis != widget.animationSpeedInMillis) {
      _controller.duration = Duration(
        milliseconds: widget.animationSpeedInMillis,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double fontSize = widget.fontSize ?? 14.0;

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        // The Text widget is wrapped with vertical padding so ShaderMask's bounds
        // completely cover font glyph descenders (e.g. 'p', 'g', 'y', 'j', 'q')
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: fontSize * 0.15),
          child: Text(
            widget.text,
            textDirection: widget.textDirection,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontFamily: widget.fontFamily,
              fontWeight: widget.fontWeight,
              height: widget.lineHeight,
              leadingDistribution: TextLeadingDistribution.even,
              color: Colors.white, // Solid canvas base for ShaderMask
            ),
          ),
        ),
        builder: (context, child) {
          final double value = _controller.value;
          final bool isRtl = widget.textDirection == TextDirection.rtl;

          // Full travel from completely outside the left boundary to completely outside the right boundary
          final double progress = isRtl ? (1.0 - value) : value;
          const double halfSpan = 1.5;
          final double offset =
              (-1.0 - halfSpan) + ((2.0 + 2.0 * halfSpan) * progress);

          return ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment(offset - halfSpan, 0.0),
                end: Alignment(offset + halfSpan, 0.0),
                colors: _effectiveColors,
                stops: _effectiveStops,
              ).createShader(bounds);
            },
            child: child,
          );
        },
      ),
    );
  }
}
