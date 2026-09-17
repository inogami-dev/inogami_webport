import 'package:flutter/material.dart';
import 'package:my_portfolio/features/home/presentation/sections/about_me/widgets/left_side_contents.dart';
import 'package:my_portfolio/features/home/presentation/sections/about_me/widgets/middle_content.dart';

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

          // Middle Contents
          MiddleContent(width: width),
          Expanded(child: Container(color: Colors.amber)),
        ],
      ),
    );
  }
}
