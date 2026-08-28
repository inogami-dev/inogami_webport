import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/animated_text.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/navbar/widgets/buttons.dart';

class MyHeader extends StatefulWidget {
  const MyHeader({
    super.key,
    required this.navBarHeight,
    required this.width,
    required this.myColorScheme,
  });

  final double navBarHeight;
  final double width;
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
      width: widget.width,
      height: widget.navBarHeight,
      padding: EdgeInsets.only(left: 24, right: 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: widget.myColorScheme.surface.withAlpha(180),
        // color: widget.myColorScheme.surface,
        borderRadius: BorderRadius.circular(50),
        // border: Border(
        //   top: BorderSide(width: 1, color: Colors.white),
        //   bottom: BorderSide(width: 1, color: Colors.white),
        // ),
        boxShadow: [
          // BoxShadow(
          //   color: widget.myColorScheme.surfaceContainerHighest.withAlpha(56),
          //   // color: Colors.white10,
          //   blurStyle: BlurStyle.inner,
          //   offset: Offset(0, -1),
          // ),
          // BoxShadow(
          //   color: widget.myColorScheme.surfaceContainerHighest.withAlpha(56),
          //   // color: Colors.white10,
          //   blurStyle: BlurStyle.inner,
          //   offset: Offset(0, 1),
          // ),
          // Outers
          BoxShadow(
            color: widget.myColorScheme.surfaceContainerHighest,
            // color: Colors.white.withAlpha(4),
            blurStyle: BlurStyle.outer,
            offset: Offset(-0.5, -1.2),
          ),
          BoxShadow(
            color: widget.myColorScheme.surfaceContainerHighest,
            // color: Colors.white.withAlpha(4),
            blurStyle: BlurStyle.outer,
            offset: Offset(0.5, 1.2),
          ),
          // BoxShadow(
          //   color: widget.myColorScheme.surfaceContainerHighest,
          //   // color: widget.myColorScheme.surfaceContainerHighest.withAlpha(56),
          //   // color: Colors.white.withAlpha(4),
          //   blurStyle: BlurStyle.outer,
          //   offset: Offset(0, 0),
          //   blurRadius: 4,
          // ),
          // BoxShadow(
          //   color: widget.myColorScheme.surfaceContainerHighest,
          //   // color: Colors.white.withAlpha(4),
          //   blurStyle: BlurStyle.outer,
          //   offset: Offset(0, 0),
          //   blurRadius: 4,
          // ),
        ],
      ),
      child: BackdropFilter(
        // filter: ImageFilter.blur(sigmaX: 4, sigmaY: 8),
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // MyText(
            //   text: "INOGAMI",
            //   fontWeight: FontWeight.bold,
            //   fontSize: kDefaultFontSize + 8,
            //   fontFamily: "Poppins",
            // ),
            MyAnimatedText(text: "INOGAMI", fontSize: kDefaultFontSize + 8),
            Spacer(flex: 6),
            normalNavBarButton(
              onTap: () {
                log("PROJECTS");
              },
              text: "PROJECTS",
            ),
            normalNavBarButton(
              onTap: () {
                log("ABOUT");
              },
              text: "ABOUT",
            ),
            normalNavBarButton(
              onTap: () {
                log("EXPERTISE");
              },
              text: "EXPERTISE",
            ),
            SizedBox(width: 8),
            // MyButton(
            //   buttonText: "CONTACT ME",
            //   widthPercentage: 0.11,
            //   height: widget.navBarHeight - 10,
            //   onTap: () {
            //     log("CONTACT ME");
            //   },
            // ),
            MyNavbarButton(
              text: "CONTACT ME",
              isUsedAsCTAButton: true,
              onTap: () {
                log("CONTACT ME");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget normalNavBarButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return
    // Expanded(
    //   child:
    MyNavbarButton(text: text, onTap: onTap, width: widget.width * 0.09);
    // );
  }
}
