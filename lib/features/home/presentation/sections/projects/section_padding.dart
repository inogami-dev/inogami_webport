import 'package:flutter/material.dart';

class MySectionPadding extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final double? topPadding;
  final Color? color;
  final Widget? linkToExtraContent;
  final CrossAxisAlignment contentAlignment;

  const MySectionPadding({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    this.padding,
    this.topPadding,
    this.color,
    this.linkToExtraContent,
    this.contentAlignment = CrossAxisAlignment.start,
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
      child: Column(
        crossAxisAlignment: contentAlignment,
        children: [
          Expanded(child: child),
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: linkToExtraContent,
          ),
        ],
      ),
    );
  }
}
