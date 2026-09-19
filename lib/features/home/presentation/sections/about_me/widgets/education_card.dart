import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/animated_text.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class EducationCard extends StatelessWidget {
  final double width;
  // final double height;
  final int cardEntryNumber; // 1 for latest, 2 for previous, etc.

  final String course;
  final String school;
  final String year;
  final List<String> achievements;

  const EducationCard({
    super.key,
    required this.width,
    // required this.height,
    this.cardEntryNumber = 1, // Defaults to 1 (full size)
    required this.course,
    required this.school,
    required this.year,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;

    // Calculate scale: each step down scales by 10%
    final double scale = (1.0 - (cardEntryNumber - 1) * 0.10).clamp(0.75, 1.0);
    final bool isLatest = cardEntryNumber == 1;

    return Container(
      // Proportionally shrink card width
      width: (width * 0.3) * scale,
      padding: EdgeInsets.fromLTRB(
        20 * scale,
        12 * scale,
        20 * scale,
        16 * scale,
      ),
      decoration: BoxDecoration(
        color: isLatest
            ? myColorScheme.surfaceContainerHigh
            : myColorScheme
                  .surfaceContainer, // Slightly lower contrast for older cards
        borderRadius: BorderRadius.circular(8 * scale),
        // border: isLatest
        //     ? Border.all(color: myColorScheme.primary.withValues(alpha: 0.3))
        //     : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            text: course,
            fontSize: (kDefaultFontSize + 3) * scale,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            textOverFlow: TextOverflow.ellipsis,
          ),
          FittedBox(
            child: MyText(
              text: school,
              fontSize: (kDefaultFontSize - 1) * scale,
            ),
          ),
          FittedBox(
            child: MyText(text: year, fontSize: (kDefaultFontSize - 3) * scale),
          ),
          SizedBox(height: 8 * scale),

          for (var achievement in achievements)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24 * scale),
              child: MyAnimatedText(
                text: achievement,
                fontSize: (kDefaultFontSize - 0.8) * scale,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
