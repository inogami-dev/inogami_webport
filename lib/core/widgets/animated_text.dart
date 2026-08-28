import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyAnimatedText extends StatefulWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final List<Color>? colors;
  final TextDirection textDirection;
  final int delayBetweenAnimationsInMillis;
  final int animationSpeedInMillis;
  final bool repeatForever;

  const MyAnimatedText({
    super.key,
    required this.text,
    this.fontFamily = "Poppins",
    this.fontSize = kDefaultFontSize,
    this.fontWeight = FontWeight.bold,
    this.colors,
    this.textDirection = TextDirection.ltr,
    this.delayBetweenAnimationsInMillis = 0,
    this.animationSpeedInMillis = 1000,
    this.repeatForever = true,
  });

  @override
  State<MyAnimatedText> createState() => _MyAnimatedTextState();
}

class _MyAnimatedTextState extends State<MyAnimatedText> {
  int _cycle = 0;
  bool _disposed = false;

  List<Color> get _effectiveColors =>
      widget.colors ??
      [Colors.white, Colors.blue.shade200, Colors.blue.shade100, Colors.white];

  void _onFinished() {
    if (!widget.repeatForever || _disposed) return;
    if (widget.delayBetweenAnimationsInMillis > 0) {
      Future.delayed(
        Duration(milliseconds: widget.delayBetweenAnimationsInMillis),
        () {
          if (mounted && !_disposed) setState(() => _cycle++);
        },
      );
    } else {
      setState(() => _cycle++);
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      // this dissolve is what replaces the hard restart-jump
      duration: const Duration(milliseconds: 600),
      switchInCurve: Curves.easeInCubic,
      switchOutCurve: Curves.easeInCubic,
      child: AnimatedTextKit(
        // a new key each cycle is what tells AnimatedSwitcher to crossfade
        key: ValueKey(_cycle),
        pause: Duration.zero,
        isRepeatingAnimation: false, // exactly one pass; we own the looping
        totalRepeatCount: 1,
        onFinished: _onFinished,
        animatedTexts: [
          ColorizeAnimatedText(
            widget.text,
            textStyle: TextStyle(
              fontSize: widget.fontSize,
              fontFamily: widget.fontFamily,
              fontWeight: widget.fontWeight,
            ),
            colors: _effectiveColors,
            textDirection: widget.textDirection,
            speed: Duration(milliseconds: widget.animationSpeedInMillis),
          ),
        ],
      ),
    );
  }
}
