import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/about_me/widgets/left_side_contents.dart';

class MyAboutMeSection extends StatelessWidget {
  final double width;
  final double height;
  const MyAboutMeSection({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;
    final double leftSideContents = width * 0.32;

    return Padding(
      padding: const EdgeInsets.only(left: 48, right: 48),
      child: Row(
        children: [
          // Left Side Contents
          AboutMeLeftSideContent(
            leftSideContents: leftSideContents,
            height: height,
          ),

          // Right Side Contents
          Expanded(
            child: Column(
              children: [
                Container(
                  width: width * 0.3,
                  height: height * 0.2,
                  color: Colors.grey,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(text: "Course", fontSize: kDefaultFontSize + 8),
                      MyText(text: "School"),
                      MyText(text: "Year"),
                      MyText(text: "Achievements"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
