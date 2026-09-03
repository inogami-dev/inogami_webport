import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/core/widgets/animate.dart';
import 'package:my_portfolio/core/widgets/animated_text.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/widgets/phone_mockup/mobile_phone_frame.dart';

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
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        alignment: Alignment.centerLeft,
        children: [
          //Background
          Positioned.fill(
            child: Container(
              width: screenWidth,
              height: effectiveHeight,
              color: myColorScheme.surfaceBright,
              // color: Colors.amber,
            ),
          ),

          Positioned(
            left: 0,
            top: 0,
            // bottom: 0,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: effectiveHeight),
                child: Container(
                  width: screenWidth * 0.6,
                  // height: effectiveHeight,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 32),
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        // myColorScheme.surface,
                        myColorScheme.surfaceContainer,
                        myColorScheme.surfaceContainerHigh,
                        myColorScheme.surfaceContainerHighest,
                        // myColorScheme.surfaceContainerHighest,
                        myColorScheme.surfaceBright,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: effectiveHeight * 0.05),
                      Container(
                        // color: Colors.green,
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        constraints: BoxConstraints(
                          maxWidth: screenWidth * 0.40,
                        ),
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        constraints: BoxConstraints(
                          maxWidth: screenWidth * 0.40,
                        ),
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
            ),
          ),

          // Right side gradient
          Positioned(
            right: 0,
            top: 0,
            // bottom: 0,
            child: Container(
              width: screenWidth * 0.25,
              height: effectiveHeight,
              decoration: BoxDecoration(
                // color: Colors.green,
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    myColorScheme.surfaceContainerHigh,
                    myColorScheme.surfaceBright,
                  ],
                ),
              ),
            ),
          ),

          // Phone Mockup
          Positioned(
            top: 0,
            // bottom: 0,
            right: 0,
            child: Container(
              width: screenWidth * 0.4,
              height: effectiveHeight,
              // color: myColorScheme.surfaceBright,
              // color: Colors.amber,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16),
              child: MyAnimation(child: MyMobilePhoneFrame()),
            ),
          ),
        ],
      ),
    );
  }
}
