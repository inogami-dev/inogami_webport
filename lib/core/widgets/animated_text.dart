import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyAnimatedText extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final List<Color> effectiveColor = [];
    if (colors != null) {
      effectiveColor.addAll(colors!);
    } else {
      effectiveColor.addAll([
        Colors.white,
        Colors.blue,
        Colors.blue.shade200,
        Colors.white,
      ]);
    }

    return AnimatedTextKit(
      pause: Duration(milliseconds: delayBetweenAnimationsInMillis),
      repeatForever: repeatForever,
      animatedTexts: [
        ColorizeAnimatedText(
          text,
          textStyle: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
          ),
          colors: effectiveColor,
          textDirection: textDirection,
          speed: Duration(milliseconds: animationSpeedInMillis),
        ),
      ],
    );
  }
}
