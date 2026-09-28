import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/widgets/button.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/data/repository/copy_to_clipboard.dart';
import 'package:my_portfolio/features/home/data/repository/email_to.dart';
import 'package:my_portfolio/features/home/data/repository/link_opener.dart';

class MyFooterSection extends StatelessWidget {
  final double width;
  final double height;
  const MyFooterSection({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;
    // final double dynamicVerticalPadding = height;

    // 1. Large gaps scale with height (clamps between 16px on small screens and 48px on large screens)
    final double largeSpacing = (height * 0.056).clamp(16.0, 56.0);
    // 2. Medium gaps (clamps between 12px and 24px)
    final double mediumSpacing = (height * 0.03).clamp(12.0, 24.0);
    // 3. Small gaps (clamps between 8px and 16px)
    final double smallSpacing = (height * 0.015).clamp(8.0, 16.0);

    return Container(
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
          SizedBox(height: largeSpacing),

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
                    MyText(text: "Contact Me On", fontFamily: "Poppins"),
                    linksLayoutChanger(
                      isLargeScreen:
                          (height > MySizeConstants.deskTopScreenMinHeight),
                      children: [
                        account(
                          icon: Icon(Icons.email, size: 24),
                          text: "dhetterjan23@gmail.com",
                          onTap: () {
                            sendEmail(
                              email: 'dhetterjan23@gmail.com',
                              subject: 'Inquiry from Portfolio',
                              body:
                                  'Hi Inogami,\n\nI saw your portfolio and would like to connect!',
                            );
                          },
                        ),
                        account(
                          icon: Icon(Icons.phone, size: 24),
                          text: "09703647429",
                          onTap: () {
                            copyToClipboard(context, "09703647429");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    MyText(text: "Follow Me On", fontFamily: "Poppins"),
                    linksLayoutChanger(
                      isLargeScreen:
                          (height > MySizeConstants.deskTopScreenMinHeight),
                      children: [
                        account(
                          icon: Image.asset(
                            "assets/images/logo/github_logo.png",
                            width: 24,
                            // height: 24,
                          ),
                          text: "inogami-dev",
                          url: "https://github.com/inogami-dev",
                        ),
                        account(
                          icon: Image.asset(
                            (Theme.of(context).brightness == Brightness.dark)
                                ? "assets/images/logo/linked_in_logo_dark.png"
                                : "assets/images/logo/linked_in_logo.png",
                            width: 22,
                            // height: 24,
                          ),
                          text: "LinkedIn",
                          url: "https://www.linkedin.com/in/lino-gamil-iii/",
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
    );
  }

  Tooltip account({
    required Widget icon,
    required String text,
    String? url,
    VoidCallback? onTap,
  }) {
    return Tooltip(
      message: (height > MySizeConstants.deskTopScreenMinHeight) ? "" : text,
      child: TextButton(
        onPressed:
            onTap ??
            () async {
              if (url == null) return;

              await openLink(url);
            },
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
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      );
    }
  }
}
