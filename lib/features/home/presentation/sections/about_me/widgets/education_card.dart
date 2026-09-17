import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/animated_text.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class EducationCard extends StatelessWidget {
  final double width;
  final double height;

  final String course;
  final String school;
  final String year;
  final List<String> achievements;
  const EducationCard({
    super.key,
    required this.width,
    required this.height,
    required this.course,
    required this.school,
    required this.year,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    final myColorSheme = Theme.of(context).colorScheme;

    return Container(
      width: width * 0.3,
      padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
      decoration: BoxDecoration(
        color: myColorSheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            text: course,
            fontSize: kDefaultFontSize + 4,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
          ),
          FittedBox(child: MyText(text: school)),
          FittedBox(
            child: MyText(text: year, fontSize: kDefaultFontSize - 2),
          ),
          SizedBox(height: 8),

          for (var achievement in achievements)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              // child: MyText(
              //   text: achievement,
              //   // fontFamily: "Poppins",
              //   fontWeight: FontWeight.w600,
              // ),
              child: MyAnimatedText(
                text: achievement,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
