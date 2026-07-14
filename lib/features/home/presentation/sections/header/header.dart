import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/header/widgets/buttons.dart';

class MyHeader extends StatefulWidget {
  const MyHeader({
    super.key,
    required this.headerHeight,
    required this.myColorScheme,
  });

  final double headerHeight;
  final ColorScheme myColorScheme;

  @override
  State<MyHeader> createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  late ColorScheme myColorScheme;
  @override
  Widget build(BuildContext context) {
    myColorScheme = Theme.of(context).colorScheme;
    return Container(
      height: widget.headerHeight,
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: widget.myColorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: widget.myColorScheme.surfaceContainerHighest,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          MyText(
            text: "INOGAMI",
            fontWeight: FontWeight.bold,
            fontSize: kDefaultFontSize + 8,
          ),
          Spacer(flex: 6),
          headerButton(
            onTap: () {
              log("PROJECTS");
            },
            text: "PROJECTS",
          ),
          headerButton(
            onTap: () {
              log("ABOUT");
            },
            text: "ABOUT",
          ),
          headerButton(
            onTap: () {
              log("EXPERTISE");
            },
            text: "EXPERTISE",
          ),
          SizedBox(width: 16),
          headerButton(
            onTap: () {
              log("CONTACT ME");
            },
            text: "CONTACT ME",
          ),
        ],
      ),
    );
  }

  Widget headerButton({required String text, required VoidCallback onTap}) {
    return Expanded(
      child: MyHeaderButton(text: text, onTap: onTap),
    );
  }
}
