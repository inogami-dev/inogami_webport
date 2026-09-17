import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/about_me/widgets/education_card.dart';
import 'package:my_portfolio/core/widgets/floating_animation.dart';
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
          SizedBox(
            width: width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                MyText(text: "Education"),

                EducationCard(
                  width: width,
                  // height: height,
                  course: 'BS Information Technology',
                  school: 'UM Tagum College',
                  year: '2022-2027',
                  achievements: [
                    "Consistent Dean's Lister",
                    "4th/16 in Hackathon Challenge 2026",
                  ],
                ),
                EducationCard(
                  cardEntryNumber: 2,
                  width: width,
                  // height: height,
                  course: 'Computer System Servicing (CSS)',
                  school: 'Lorenzo S. Sarmiento Sr. NHS',
                  year: '2020-2022',
                  achievements: [
                    "With High Honors",
                    "Rank 5th in Overall Honors",
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: Container(color: Colors.amber)),
        ],
      ),
    );
  }
}
