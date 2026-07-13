import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({
    super.key,
    required this.headerHeight,
    required this.myColorScheme,
  });

  final double headerHeight;
  final ColorScheme myColorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: myColorScheme.surfaceContainerHighest,
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

  Widget headerButton({required String text, VoidCallback? onTap}) {
    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.cell,
        onHover: (event) {
          log("MOUSE HOVER on ${event.position}");
        },
        child: Container(
          // color: Colors.blueGrey,
          margin: EdgeInsets.only(right: 2),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: onTap,

            child: MyText(text: text),
          ),
        ),
      ),
    );
  }
}
