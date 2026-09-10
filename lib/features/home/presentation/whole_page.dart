import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/navbar/navbar.dart';
import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/above_the_fold.dart';
import 'package:my_portfolio/features/home/presentation/sections/projects/projects.dart';
import 'package:my_portfolio/features/home/presentation/sections/projects/section_padding.dart';
import 'package:my_portfolio/features/home/presentation/sections/projects/widgets/project_detail_dialog.dart';

class MyHomePage extends StatefulWidget {
  final double screenHeight;
  const MyHomePage({super.key, required this.screenHeight});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey aboveTheFoldSectionKey = GlobalKey();
  final GlobalKey projectSectionKey = GlobalKey();
  final GlobalKey aboutMeSectionKey = GlobalKey();
  final GlobalKey certificationsSectionKey = GlobalKey();
  final GlobalKey contactSectionKey = GlobalKey();
  final List<GlobalKey> sectionKeys = [];

  final ScrollController scrollController = ScrollController();
  final ValueNotifier<int> activeSectionNotifier = ValueNotifier<int>(0);

  /// For the snap-scrolling feature variables: [_snapDebounceTimer], [_isSnapping]
  Timer? _snapDebounceTimer;
  bool _isSnapping = false;

  @override
  void initState() {
    super.initState();
    sectionKeys.addAll([
      aboveTheFoldSectionKey,
      projectSectionKey,
      aboutMeSectionKey,
      certificationsSectionKey,
      contactSectionKey,
    ]);
    scrollController.addListener(_checkVisibleSection);
  }

  @override
  void dispose() {
    super.dispose();
    _snapDebounceTimer?.cancel();
    scrollController.dispose();
    activeSectionNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;
    double navBarHeight = 45;
    final width = MyDimensions.width(context);
    final height = MyDimensions.height(context);
    const double minHeight = 400.0;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Main Body
          Positioned(
            top: 0,
            child: Container(
              width: width,
              height: height,
              color: myColorScheme.surface,
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  // Listens to real scroll movements (mouse wheel, trackpad, drag)
                  if (notification is ScrollUpdateNotification) {
                    // Only snap if we aren't already animating from a navbar button click
                    if (!_isSnapping) {
                      _onUserScrolled();
                    }
                  }
                  return false; // Allows the notification to continue bubbling up
                },
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      // Hero Section
                      MyHeroSection(
                        key: aboveTheFoldSectionKey,
                        navBarHeight: navBarHeight,
                        screenHeight: widget.screenHeight.clamp(
                          minHeight,
                          double.infinity,
                        ),
                      ),

                      // Project Section
                      MySectionPadding(
                        key: projectSectionKey,
                        width: width,
                        height: widget.screenHeight.clamp(
                          minHeight,
                          double.infinity,
                        ),
                        topPadding: navBarHeight + 24,
                        // color: Colors.green,
                        linkToExtraContent: TextButton(
                          onPressed: () {
                            // showMyProjectDetailModal(
                            //   context: context,
                            //   // title: "More Projects?",
                            //   // fullDescription: "kjandk akjdkad wajndkaw",
                            //   isFullScreen: true,
                            // );
                          },
                          child: MyText(
                            text:
                                "Explore more of my open-source experiments and repositories on GitHub.",
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        child: MyProjectsSection(
                          screenHeight: widget.screenHeight.clamp(
                            minHeight,
                            double.infinity,
                          ),
                          sectionTitle: "PROJECTS",
                        ),
                      ),

                      // Additional Section
                      SizedBox(
                        key: aboutMeSectionKey,
                        height: widget.screenHeight.clamp(
                          minHeight,
                          double.infinity,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  child: Placeholder(
                                    child: MyText(text: "ABOUT ME"),
                                  ),
                                ),
                                Expanded(child: Placeholder()),
                              ],
                            ),
                            Expanded(child: Placeholder()),
                          ],
                        ),
                      ), // Additional Section
                      SizedBox(
                        key: certificationsSectionKey,
                        height: widget.screenHeight.clamp(
                          minHeight,
                          double.infinity,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  child: Placeholder(
                                    child: MyText(text: "CERTIFICATIONS"),
                                  ),
                                ),
                                Expanded(child: Placeholder()),
                              ],
                            ),
                            Expanded(child: Placeholder()),
                          ],
                        ),
                      ),

                      // Footer
                      SizedBox(
                        key: contactSectionKey,
                        height: widget.screenHeight.clamp(
                          minHeight,
                          double.infinity,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  child: Placeholder(
                                    child: MyText(text: "Footer"),
                                  ),
                                ),
                                Expanded(child: Placeholder()),
                              ],
                            ),
                            Expanded(child: Placeholder()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Navbar
          Positioned(
            top: 8,
            left: 16,
            right: 16,
            child:
                // Header
                RepaintBoundary(
                  child: MyNavBar(
                    sectionKeys: sectionKeys,
                    width: width,
                    navBarHeight: navBarHeight,
                    myColorScheme: myColorScheme,
                    activeSectionNotifier: activeSectionNotifier,
                  ),
                ),
          ),
        ],
      ),
    );
  }

  void _onUserScrolled() {
    // If the automated snapping animation is running, don't trigger another timer
    if (_isSnapping) return;

    // Reset the timer every time a new mouse wheel tick occurs
    _snapDebounceTimer?.cancel();
    _snapDebounceTimer = Timer(const Duration(milliseconds: 200), () {
      _snapToNearestSection();
    });
  }

  void _snapToNearestSection() {
    if (_isSnapping) return;
    if (!scrollController.hasClients) return;

    // Find which section is physically closest to the top of the viewport
    int closestIndex = -1;
    double minDistance = double.infinity;

    for (int i = 0; i < sectionKeys.length; i++) {
      final key = sectionKeys[i];
      if (key.currentContext != null) {
        final RenderBox box =
            key.currentContext!.findRenderObject() as RenderBox;
        final Offset position = box.localToGlobal(Offset.zero);

        // position.dy is this section's distance from the top of the screen
        final double distance = position.dy.abs();

        if (distance < minDistance) {
          minDistance = distance;
          closestIndex = i;
        }
      }
    }

    // Only snap if we are within the 16px "catch zone"
    const double snapThreshold = 32;
    // Do nothing if:
    // - We couldn't find a section, OR
    // - Already perfectly aligned (< 2px), OR
    // - We stopped too far away (> 16px)
    if (closestIndex == -1 ||
        minDistance < 2.0 ||
        minDistance > snapThreshold) {
      return;
    }
    _isSnapping = true;

    // Smoothly glide the closest section to the top
    Scrollable.ensureVisible(
      sectionKeys[closestIndex].currentContext!,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
    ).then((_) {
      _isSnapping = false;
    });
  }

  void _checkVisibleSection() {
    // The invisible line on the screen that triggers the change (e.g., 100px from the top)
    const double detectionLine = 250.0;

    final Map<int, GlobalKey> sections = {
      0: aboveTheFoldSectionKey,
      1: projectSectionKey,
      2: aboutMeSectionKey,
      3: certificationsSectionKey,
      4: contactSectionKey,
    };

    for (var entry in sections.entries) {
      final key = entry.value;

      if (key.currentContext != null) {
        final RenderBox box =
            key.currentContext!.findRenderObject() as RenderBox;

        // Find the Y position of the section relative to the top of the viewport
        final Offset position = box.localToGlobal(Offset.zero);
        final double topY = position.dy;
        final double bottomY = topY + box.size.height;

        // If the detection line is inside this section's boundaries
        if (topY <= detectionLine && bottomY > detectionLine) {
          // Only update if it actually changed to avoid unnecessary work
          if (activeSectionNotifier.value != entry.key) {
            activeSectionNotifier.value = entry.key;
          }
          break; // Stop checking once we find the visible section
        }
      }
    }
  }
}
