import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/animated_text.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class CurrentEndeavorCard extends StatelessWidget {
  final double width;
  // final double height;
  final int cardEntryNumber; // 1 for latest, 2 for previous, etc.

  final String title;
  final String description;

  const CurrentEndeavorCard({
    super.key,
    required this.width,
    // required this.height,
    this.cardEntryNumber = 1, // Defaults to 1 (full size)
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;

    // Calculate scale: each step down scales by 10%
    final double scale = (1.0 - (cardEntryNumber - 1) * 0.05).clamp(0.75, 1.0);
    final bool isLatest = cardEntryNumber == 1;

    return Container(
      // Proportionally shrink card width
      width: (width * 0.3) * scale,
      padding: EdgeInsets.fromLTRB(
        16 * scale,
        8 * scale,
        16 * scale,
        12 * scale,
      ),
      decoration: BoxDecoration(
        // color: myColorScheme.surfaceContainerHigh,
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
        spacing: 8,
        children: [
          MyText(
            text: title,
            fontSize: (kDefaultFontSize + 3) * scale,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
          ),
          MyText(
            text: description,
            fontSize: (kDefaultFontSize - 1) * scale,
            maxLines: 16,
          ),
        ],
      ),
    );
  }
}
