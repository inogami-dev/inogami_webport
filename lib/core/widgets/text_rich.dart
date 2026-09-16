import 'package:flutter/material.dart';

class MyTextRich extends StatelessWidget {
  final List<InlineSpan> children;
  final String? fontFamily;
  const MyTextRich({super.key, required this.children, this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(fontFamily: fontFamily ?? "Quicksand"),
        children: children,
      ),
    );
  }
}
