import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/core/widgets/animate.dart';
import 'package:my_portfolio/core/widgets/animated_text.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/domain/my_extensions/build_context_extension.dart';
import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/widgets/phone_mockup/image_gallery.dart';
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

    if (context.isMobile) {
      return SizedBox(
        width: screenWidth,
        height: widget.screenHeight,
        // color: Colors.blue,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            MyImageGallery(
              images: [
                // Image.asset("assets/images/me.webp", fit: BoxFit.contain)
                "assets/images/me.webp", "assets/images/me2.webp",
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: screenWidth,
                height: widget.screenHeight * 0.5,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: MySizeConstants.genericHorizontalPadding,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      myColorScheme.surface,
                      myColorScheme.surface.withAlpha(200),
                      myColorScheme.surface.withAlpha(127),
                      myColorScheme.surface.withAlpha(0),
                      // myColorScheme.surfaceContainerHigh,
                      // myColorScheme.surfaceContainerHighest,
                      // // myColorScheme.surfaceContainerHighest,
                      // myColorScheme.surfaceBright,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 8,
                  children: [
                    MyAnimatedText(
                      text: "Mobile App Developer",
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      fontSize: 32,
                      lineHeight: 1.1,
                    ),
                    MyText(
                      text:
                          "Crafting purposeful, cross-platform mobile experiences with Flutter. Built on a simple principle: every app should be functionally reliable under the hood and effortlessly elegant on the screen.",
                      maxLines: 14,
                    ),
                    SizedBox(height: widget.screenHeight * 0.07),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   child: Column(
            //     children: [
            //       MyAnimatedText(
            //         text: "Mobile App Developer",
            //         fontWeight: FontWeight.bold,
            //         fontFamily: "Poppins",
            //         fontSize: 32,
            //         lineHeight: 1.1,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      );
    }
    // For Tablet and Desktop View
    else {
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
                    width: screenWidth * (context.isDesktop ? 0.6 : 0.62),
                    // height: effectiveHeight,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(
                      right: (context.isDesktop ? 32 : 16),
                    ),
                    decoration: BoxDecoration(
                      // color: Colors.orange,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            maxWidth:
                                screenWidth * (context.isDesktop ? 0.40 : 0.54),
                          ),
                          child: MyAnimatedText(
                            text: "Mobile App Developer",
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            fontSize: (context.isDesktop) ? 64 : 48,
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
                            maxWidth:
                                screenWidth * (context.isDesktop ? 0.40 : 0.54),
                          ),
                          child: MyText(
                            text:
                                "Crafting purposeful, cross-platform mobile experiences with Flutter. Built on a simple principle: every app should be functionally reliable under the hood and effortlessly elegant on the screen.",
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
                margin: EdgeInsets.only(top: widget.navBarHeight / 2),
                child: MyAnimation(child: MyMobilePhoneFrame()),
              ),
            ),
          ],
        ),
      );
    }
  }
}
