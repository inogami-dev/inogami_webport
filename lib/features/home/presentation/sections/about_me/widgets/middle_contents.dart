import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/about_me/widgets/education_card.dart';

class AboutMeMiddleContent extends StatelessWidget {
  final double width;
  final double height;

  const AboutMeMiddleContent({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    SizedBox sizedBox = SizedBox(
      width: width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            school: 'Lorenzo S. Sarmiento Sr. National High School',
            year: '2020-2022',
            achievements: ["With High Honors", "Rank 5th in Overall Honors"],
          ),
        ],
      ),
    );

    if (height < 425) {
      return SingleChildScrollView(child: sizedBox);
    } else {
      return sizedBox;
    }
  }
}
