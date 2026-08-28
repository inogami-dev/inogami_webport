import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/core/widgets/animated_text.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class MyHeroSection extends StatefulWidget {
  final double screenHeight;
  final double navBarHeight;
  const MyHeroSection({
    super.key,
    required this.screenHeight,
    required this.navBarHeight,
  });

  @override
  State<MyHeroSection> createState() => _MyHeroSectionState();
}

class _MyHeroSectionState extends State<MyHeroSection> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MyDimensions.width(context);
    final double effectiveHeight =
        widget.screenHeight - (widget.navBarHeight / 4);
    final myColorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: screenWidth,
      height: effectiveHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SingleChildScrollView(
            child: SizedBox(
              // color: Colors.amber,
              width: screenWidth / 2,
              height: effectiveHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: effectiveHeight * 0.05),
                  Container(
                    // color: Colors.green,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    constraints: BoxConstraints(maxWidth: screenWidth * 0.40),
                    // child: MyText(
                    //   text: "Mobile App Developer",
                    //   maxLines: 7,
                    //   fontWeight: FontWeight.bold,
                    //   fontFamily: "Poppins",
                    //   fontSize: 64,
                    //   lineHeight: 1.1,
                    //   // fontFamily: "Inter",
                    // ),
                    child: MyAnimatedText(
                      text: "Mobile App Developer",
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      fontSize: 64,
                      lineHeight: 1.1,
                    ),
                  ),
                  Container(
                    // color: Colors.pink,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    constraints: BoxConstraints(maxWidth: screenWidth * 0.40),
                    child: MyText(
                      text:
                          "Placeholder 1 T dsdcjbsk se skjf ksjfb skjebfkj kjsebfjke kjsef kjsbe jksfb ef skjf ksjfb skjebfkj kjsebfjke kjsef kjsbe jksfbef scac jkas skjf ksjfb skjebfkj kjsebfjke kjsef kjsbe jksfbef skjfn skjf ksjfb skjebfkj kjsebfjke kjsef kjsbe jksfbef skjf ksjfb skjebfkj kjsebfjke kjsef kjsbe jksfbef skjf ksjfb skjebfkj kjsebfjke kjsef kjsbe jksfbef skjf ksjfb skjebfkj kjsebfjke kjsef kjsbe jksfbef js aij oief noisda doqw odiwdioq ddkaldn.",
                      maxLines: 14,
                    ),
                  ),
                ],
              ),
            ),
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
