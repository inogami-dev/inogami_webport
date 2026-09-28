import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/widgets/button.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class MyFooterSection extends StatelessWidget {
  final double width;
  final double height;
  const MyFooterSection({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;
    // final double dynamicVerticalPadding = height;

    // 1. Large gaps scale with height (clamps between 16px on small screens and 48px on large screens)
    final double largeSpacing = (height * 0.05).clamp(16.0, 48.0);
    // 2. Medium gaps (clamps between 12px and 24px)
    final double mediumSpacing = (height * 0.03).clamp(12.0, 24.0);
    // 3. Small gaps (clamps between 8px and 16px)
    final double smallSpacing = (height * 0.015).clamp(8.0, 16.0);

    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.only(
          // top: (height * 0.04).clamp(8, 56),
          left: MySizeConstants.genericHorizontalPadding,
          right: MySizeConstants.genericHorizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            const MyText(
              text: "Like what you see?\nHire me!",
              fontSize: kDefaultFontSize + 24,
              fontFamily: "Poppins",
              textAlign: TextAlign.center,
              lineHeight: 1.1,
              maxLines: 4,
            ),
            SizedBox(height: mediumSpacing),

            SizedBox(
              width: width * 0.65,
              child: MyText(
                text:
                    "Currently looking for a Mobile Developer role. kjad adbkajbwd akjbdakjbwdwa djbakdjbawkjd akjbda dkjawdbabwdkjad akdjbbakw kjbdakjbwdwa djbakdjbawkjd akjbda dkjawdbabwdkjad akdjbbakw kjbdakjbwdwa djbakdjbawkjd akjbda dkj",
                // fontSize: kDefaultFontSize + 24,
                fontFamily: "Poppins",
                textAlign: TextAlign.center,
                maxLines: 6,
              ),
            ),
            SizedBox(height: largeSpacing),

            // MyButton(
            //   buttonText: "HIRE ME",
            //   buttonTextColor: myColorScheme.onSurface,
            //   buttonTextFontSize: kDefaultFontSize + 8,
            //   buttonTextFontWeight: FontWeight.w600,
            //   buttonTextFontFamily: "Quicksand",
            //   widthPercentage: 0.12,
            //   onTap: () {},
            // ),

            //
            SizedBox(
              width: width * 0.65,
              // color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 24,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      MyText(text: "Contact Me On"),
                      linksLayoutChanger(
                        isLargeScreen:
                            (height > MySizeConstants.deskTopScreenMinHeight),
                        children: [
                          account(
                            icon: Icon(Icons.email, size: 24),
                            text: "dhetterjan23@gmail.com",
                          ),
                          account(
                            icon: Icon(Icons.phone_android_rounded, size: 24),
                            text: "09876543210",
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      MyText(text: "Follow Me On"),
                      linksLayoutChanger(
                        isLargeScreen:
                            (height > MySizeConstants.deskTopScreenMinHeight),
                        children: [
                          account(
                            icon: Icon(Icons.email, size: 24),
                            text: "dhetterjan23@gmail.com",
                          ),
                          account(
                            icon: Icon(Icons.phone_android_rounded, size: 24),
                            text: "09876543210",
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: largeSpacing),

            //
            MyButton(
              buttonText: "Download Resume",
              buttonTextColor: Colors.white,
              buttonTextFontSize: kDefaultFontSize + ((width > 1160) ? 2 : 0),
              buttonTextFontWeight: FontWeight.w600,
              buttonTextFontFamily: "Quicksand",
              widthPercentage: 0.16,
              borderWidth: 1,
              onTap: () {},
            ),
            // const SizedBox(height: 48),

            Spacer(),

            //
            MyText(
              text: "Designed and built from scratch using Flutter Web • 2026",
              // color: myColorScheme.onSurface.withAlpha(100),
              color: myColorScheme.outline,
            ),
            SizedBox(height: smallSpacing),
          ],
        ),
      ),
    );
  }

  Tooltip account({required Icon icon, required String text}) {
    return Tooltip(
      message: (height > MySizeConstants.deskTopScreenMinHeight) ? "" : text,
      child: TextButton(
        onPressed: () {},
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            if (height > MySizeConstants.deskTopScreenMinHeight)
              MyText(text: text),
          ],
        ),
      ),
    );
  }
}

Widget linksLayoutChanger({
  required bool isLargeScreen,
  required List<Widget> children,
}) {
  if (isLargeScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  } else {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: children);
  }
}
