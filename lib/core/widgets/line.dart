import 'package:flutter/material.dart';

class MyLine extends StatelessWidget {
  final bool isHorizontal;
  final double width;
  final double height;
  final Color? color;
  final double? mainPadding;
  final double? crossPadding;

  const MyLine({
    super.key,
    this.isHorizontal = true,
    this.width = 1,
    this.color,
    this.height = double.infinity,
    this.mainPadding,
    this.crossPadding,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme myColorScheme = Theme.of(context).colorScheme;

    if (isHorizontal) {
      return Container(
        width: height,
        height: width,
        color: color ?? myColorScheme.outlineVariant,
        margin: EdgeInsets.only(
          top: mainPadding ?? 16,
          bottom: mainPadding ?? 16,
          left: crossPadding ?? 0,
          right: crossPadding ?? 0,
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        color: color ?? myColorScheme.outlineVariant,
        margin: EdgeInsets.only(
          left: mainPadding ?? 16,
          right: mainPadding ?? 16,
          top: crossPadding ?? 0,
          bottom: crossPadding ?? 0,
        ),
      );
    }
  }
}
