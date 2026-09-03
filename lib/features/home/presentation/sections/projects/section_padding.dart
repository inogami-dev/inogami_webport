import 'package:flutter/material.dart';

class MySectionPadding extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final double? topPadding;
  final Color? color;
  const MySectionPadding({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    this.padding,
    this.topPadding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Constraint
    if (topPadding != null && padding != null) {
      throw Exception(
        'Cannot provide both padding and topPadding. Please provide only either one of them.',
      );
    }

    return Container(
      width: width,
      height: height,
      color: color,
      padding: padding ?? EdgeInsets.only(top: topPadding ?? 0),
      child: child,
    );
  }
}
