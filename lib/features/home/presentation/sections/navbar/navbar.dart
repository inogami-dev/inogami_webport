import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/animated_text.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/navbar/widgets/buttons.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({
    super.key,
    required this.navBarHeight,
    required this.width,
    required this.myColorScheme,
    required this.sectionKeys,
    required this.activeSectionNotifier,
  });

  final double navBarHeight;
  final double width;
  final ColorScheme myColorScheme;
  final List<GlobalKey> sectionKeys;
  final ValueNotifier<int> activeSectionNotifier;

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  late GlobalKey currentSection;
  static const int aboveTheFoldSectionID = 0;
  static const int projectsSectionID = 1;
  static const int aboutMeSectionID = 2;
  static const int certificationsSectionID = 3;
  static const int footerSectionID = 4;

  @override
  void initState() {
    super.initState();
    currentSection = widget.sectionKeys[aboveTheFoldSectionID];
  }

  //   // Inside your Navbar widget, listen to the notifier
  //  ValueListenableBuilder<String>(
  //   valueListenable: activeSectionNotifier, // Pass the notifier into your Navbar
  //   builder: (context, activeSection, child) {

  //     // Check if this specific button is the active one
  //     final bool isActive = activeSection == 'Projects';

  //     return TextButton(
  //       onPressed: () { /* Your existing scroll code */ },
  //       style: TextButton.styleFrom(
  //         // Change color based on visibility!
  //         foregroundColor: isActive ? Colors.blue : Colors.grey,
  //       ),
  //       child: const Text('Projects'),
  //     );
  //   },

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: widget.activeSectionNotifier,
      builder: (context, activeSectionID, child) {
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
            //   top: BorderSide(
            //     width: 0.4,
            //     color: widget.myColorScheme.onSurface.withAlpha(56),
            //   ),
            //   bottom: BorderSide(
            //     width: 0.4,
            //     color: widget.myColorScheme.onSurface.withAlpha(56),
            //   ),
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

              // This shadow is for the light theme, to give a subtle glow effect
              if (Theme.of(context).brightness == Brightness.light)
                BoxShadow(
                  color: widget.myColorScheme.primaryContainer,
                  // color: Colors.yellow,
                  // color: Colors.white.withAlpha(4),
                  blurStyle: BlurStyle.outer,
                  offset: Offset(0, 1.2),
                ),
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
                    // setState(() => currentSection = sectionKey);
                    if (sectionKey.currentContext != null) {
                      Scrollable.ensureVisible(
                        sectionKey.currentContext!,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOutCubic,
                      );
                    }
                  },
                  child: IgnorePointer(
                    child: (aboveTheFoldSectionID == activeSectionID)
                        ? MyAnimatedText(
                            text: "INOGAMI",
                            fontSize: kDefaultFontSize + 8,
                          )
                        : MyText(
                            text: "INOGAMI",
                            fontFamily: "Poppins",
                            fontSize: kDefaultFontSize + 8,
                            fontWeight: FontWeight.bold,
                          ),
                  ),
                ),
                Spacer(flex: 6),
                normalNavBarButton(
                  text: "PROJECTS",
                  section: projectsSectionID,
                  activeSection: activeSectionID,
                  onTap: () {
                    log("PROJECTS");

                    GlobalKey sectionKey =
                        widget.sectionKeys[projectsSectionID];

                    if (sectionKey.currentContext != null) {
                      Scrollable.ensureVisible(
                        sectionKey.currentContext!,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOutCubic,
                      );
                    }
                  },
                ),
                normalNavBarButton(
                  text: "ABOUT",
                  section: aboutMeSectionID,
                  activeSection: activeSectionID,
                  onTap: () {
                    log("ABOUT");

                    GlobalKey sectionKey = widget.sectionKeys[aboutMeSectionID];

                    if (sectionKey.currentContext != null) {
                      Scrollable.ensureVisible(
                        sectionKey.currentContext!,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOutCubic,
                      );
                    }
                  },
                ),
                normalNavBarButton(
                  text: "CERTIFCATES",
                  section: 3,
                  activeSection: activeSectionID,
                  widthPercentage: .108,
                  onTap: () {
                    log("CERTIFCATES");
                    GlobalKey sectionKey =
                        widget.sectionKeys[certificationsSectionID];

                    if (sectionKey.currentContext != null) {
                      Scrollable.ensureVisible(
                        sectionKey.currentContext!,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOutCubic,
                      );
                    }
                  },
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
                  isSelected: footerSectionID == activeSectionID,
                  onTap: () {
                    log("CONTACT ME");
                    GlobalKey sectionKey = widget.sectionKeys[footerSectionID];

                    if (sectionKey.currentContext != null) {
                      Scrollable.ensureVisible(
                        sectionKey.currentContext!,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOutCubic,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget normalNavBarButton({
    required String text,
    required VoidCallback onTap,
    required int section,
    required activeSection,
    double widthPercentage = 0.09,
  }) {
    return
    // Expanded(
    //   child:
    MyNavbarButton(
      text: text,
      onTap: onTap,
      width: widget.width * widthPercentage,
      // isSelected: currentSectionDeterminer(section),
      isSelected: section == activeSection,
    );
    // );
  }

  // bool currentSectionDeterminer(int section) {
  //   if (section > widget.sectionKeys.length) return false;

  //   if (currentSection == widget.sectionKeys[section]) {
  //     log("TRUEEEEEEEEEE");
  //     return true;
  //   }

  //   return false;
  // }
}
