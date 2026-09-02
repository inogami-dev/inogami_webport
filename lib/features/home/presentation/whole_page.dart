import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/navbar/navbar.dart';
import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/above_the_fold.dart';

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
  final List<GlobalKey> sectionKeys = [];

  final ScrollController scrollController = ScrollController();
  final ValueNotifier<int> activeSectionNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    sectionKeys.addAll([
      aboveTheFoldSectionKey,
      projectSectionKey,
      aboutMeSectionKey,
      certificationsSectionKey,
    ]);
    scrollController.addListener(_checkVisibleSection);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    activeSectionNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;
    double navBarHeight = 45;
    final width = MyDimensions.width(context);
    final height = MyDimensions.height(context);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: width,
              height: height,
              color: myColorScheme.surface,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    // Hero Section
                    MyHeroSection(
                      key: aboveTheFoldSectionKey,
                      navBarHeight: navBarHeight,
                      screenHeight: widget.screenHeight,
                    ),
                    // Additional Section
                    SizedBox(
                      key: projectSectionKey,
                      height: widget.screenHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Expanded(
                                child: Placeholder(
                                  child: MyText(text: "PROJECTS"),
                                ),
                              ),
                              Expanded(child: Placeholder()),
                            ],
                          ),
                          Expanded(child: Placeholder()),
                        ],
                      ),
                    ),
                    // Additional Section
                    SizedBox(
                      key: aboutMeSectionKey,
                      height: widget.screenHeight,
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
                      height: widget.screenHeight,
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
                  ],
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

  void _checkVisibleSection() {
    // The invisible line on the screen that triggers the change (e.g., 100px from the top)
    const double detectionLine = 250.0;

    // Map your sections to their respective keys
    final Map<int, GlobalKey> sections = {
      0: aboveTheFoldSectionKey,
      1: projectSectionKey,
      2: aboutMeSectionKey,
      3: certificationsSectionKey,
      // 4:
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
