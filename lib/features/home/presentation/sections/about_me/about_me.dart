import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/about_me/widgets/current_endeavor_card.dart';
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
          AboutMeMiddleContent(width: width),
          SizedBox(width: 16),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  MyText(text: "Current Endeavors"),
                  CurrentEndeavorCard(
                    width: width,
                    title: "Temp 1",
                    description:
                        "knadkn kwjdbkajd wdkjabdjk wkknadkn kwjdbkajd wdkjabdjk wkakd wdaakd wdknknadkn kwjdbkajd wdkjabdjk wkakd wdaadkn kwjdbkajd wdkjabdjk wkakd wdaknadkn kwjdbkajd wdkjabdjk wkakd wdaa",
                  ),
                  CurrentEndeavorCard(
                    width: width,
                    cardEntryNumber: 2,
                    title: "Temp 2",
                    description:
                        "mnBDmna d man dmw nkna dkn kwjdbkajd wdkjabdjk wkakd wdakn adkn kwjdbkajd wdkjabdjk wkakd wdadwdand mnwd adn amknadkn kwjdbkajd wdkjabdjk wkakd wdad awmd amndbad",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
