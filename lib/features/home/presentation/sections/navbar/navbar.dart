import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/animated_text.dart';
import 'package:my_portfolio/features/home/presentation/sections/navbar/widgets/buttons.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({
    super.key,
    required this.navBarHeight,
    required this.width,
    required this.myColorScheme,
    required this.sectionKeys,
  });

  final double navBarHeight;
  final double width;
  final ColorScheme myColorScheme;
  final List<GlobalKey> sectionKeys;

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  late GlobalKey currentSection;
  late ColorScheme myColorScheme;
  static const int aboveTheFoldSectionID = 0;
  static const int projectsSection = 1;
  static const int aboutMeSectionID = 2;
  static const int certificationsSectionID = 3;
  // static const int footerSectionID = 4;

  @override
  void initState() {
    super.initState();
    currentSection = widget.sectionKeys[aboveTheFoldSectionID];
  }

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
            InkWell(
              onTap: () {
                log("ABOVE THE FOLD SECTION");
                GlobalKey sectionKey =
                    widget.sectionKeys[aboveTheFoldSectionID];
                setState(() => currentSection = sectionKey);
                if (sectionKey.currentContext != null) {
                  Scrollable.ensureVisible(
                    sectionKey.currentContext!,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOutCubic,
                  );
                }
              },
              child: IgnorePointer(
                child: MyAnimatedText(
                  text: "INOGAMI",
                  fontSize: kDefaultFontSize + 8,
                ),
              ),
            ),
            Spacer(flex: 6),
            normalNavBarButton(
              onTap: () {
                log("PROJECTS");

                GlobalKey sectionKey = widget.sectionKeys[projectsSection];
                setState(() => currentSection = sectionKey);

                if (sectionKey.currentContext != null) {
                  Scrollable.ensureVisible(
                    sectionKey.currentContext!,
                    duration: const Duration(milliseconds: 800),
                    // 2. Curve dictates the style of the motion (easeInOut starts slow, speeds up, then slows down to stop)
                    curve: Curves.easeInOutCubic,
                  );
                }
              },
              section: 1,
              text: "PROJECTS",
            ),
            normalNavBarButton(
              onTap: () {
                log("ABOUT");

                GlobalKey sectionKey = widget.sectionKeys[aboutMeSectionID];
                setState(() => currentSection = sectionKey);

                if (sectionKey.currentContext != null) {
                  Scrollable.ensureVisible(
                    sectionKey.currentContext!,
                    duration: const Duration(milliseconds: 800),
                    // 2. Curve dictates the style of the motion (easeInOut starts slow, speeds up, then slows down to stop)
                    curve: Curves.easeInOutCubic,
                  );
                }
              },
              section: 2,
              text: "ABOUT",
            ),
            normalNavBarButton(
              onTap: () {
                log("CERTIIFCATIONS");
                GlobalKey sectionKey =
                    widget.sectionKeys[certificationsSectionID];
                setState(() => currentSection = sectionKey);

                if (sectionKey.currentContext != null) {
                  Scrollable.ensureVisible(
                    sectionKey.currentContext!,
                    duration: const Duration(milliseconds: 800),
                    // 2. Curve dictates the style of the motion (easeInOut starts slow, speeds up, then slows down to stop)
                    curve: Curves.easeInOutCubic,
                  );
                }
              },
              section: 3,
              text: "CERTIIFCATES",
              widthPercentage: .11,
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
    required int section,
    double widthPercentage = 0.09,
  }) {
    return
    // Expanded(
    //   child:
    MyNavbarButton(
      text: text,
      onTap: onTap,
      width: widget.width * widthPercentage,
      isSelected: currentSectionDeterminer(section),
    );
    // );
  }

  bool currentSectionDeterminer(int section) {
    if (section > widget.sectionKeys.length) return false;

    if (currentSection == widget.sectionKeys[section]) {
      log("TRUEEEEEEEEEE");
      return true;
    }

    return false;
  }
}
