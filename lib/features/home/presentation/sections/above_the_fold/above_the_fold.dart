import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class MyHeroSection extends StatefulWidget {
  final double screenHeight;
  final double headerHeight;
  const MyHeroSection({
    super.key,
    required this.screenHeight,
    required this.headerHeight,
  });

  @override
  State<MyHeroSection> createState() => _MyHeroSectionState();
}

class _MyHeroSectionState extends State<MyHeroSection> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final myColorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: widget.screenHeight - widget.headerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  constraints: BoxConstraints(maxWidth: screenWidth * 0.40),
                  child: MyText(
                    text:
                        "Placeholder 1 T dsdcjbsk se skjf ksjfb skjebfkj kjsebfjke kjsef kjsbe jksfbef",
                    maxLines: 7,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    // fontFamily: "Inter",
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  constraints: BoxConstraints(maxWidth: screenWidth * 0.40),
                  child: MyText(
                    text:
                        "Placeholder 1 T dsdcjbsk se skjf ksjfb skjebfkj kjsebfjke kjsef kjsbe jksfbef",
                    maxLines: 7,
                  ),
                ),
              ),
            ],
          ),
          // My Image
          Expanded(
            child: Container(
              width: 100,
              color: myColorScheme.primary.withAlpha(10),
            ),
          ),
        ],
      ),
    );
  }
}
