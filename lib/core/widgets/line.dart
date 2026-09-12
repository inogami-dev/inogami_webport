import 'package:flutter/material.dart';

class MyLine extends StatelessWidget {
  final bool isHorizontal;
  final double width;
  final double height;
  final Color color;
  final double mainPadding;
  final double crossPadding;

  const MyLine({
    super.key,
    this.isHorizontal = true,
    this.width = 1,
    this.color = const Color.fromARGB(56, 245, 245, 245),
    this.height = double.infinity,
    this.mainPadding = 16,
    this.crossPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      return Container(
        width: height,
        height: width,
        color: color,
        margin: EdgeInsets.only(
          top: mainPadding,
          bottom: mainPadding,
          left: crossPadding,
          right: crossPadding,
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        color: color,
        margin: EdgeInsets.only(
          left: mainPadding,
          right: mainPadding,
          top: crossPadding,
          bottom: crossPadding,
        ),
      );
    }
  }
}
