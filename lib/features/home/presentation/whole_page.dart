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

  @override
  void initState() {
    super.initState();
    sectionKeys.addAll([
      aboveTheFoldSectionKey,
      projectSectionKey,
      aboutMeSectionKey,
      certificationsSectionKey,
    ]);
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
                MyNavBar(
                  sectionKeys: sectionKeys,
                  width: width,
                  navBarHeight: navBarHeight,
                  myColorScheme: myColorScheme,
                ),
          ),
        ],
      ),
    );
  }
}
