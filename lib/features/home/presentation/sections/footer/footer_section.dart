import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/widgets/button.dart';
import 'package:my_portfolio/core/widgets/line.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/data/repository/copy_to_clipboard.dart';
import 'package:my_portfolio/features/home/data/repository/download_resume.dart';
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

    // Usable for hiding or showing something based on the current screen size.
    final bool isAboveMinHeight =
        height > MySizeConstants.deskTopScreenMinHeight;

    // Large gaps scale with height (clamps between 16px on small screens and 48px on large screens)
    final double largeSpacing = (height * 0.056).clamp(16.0, 56.0);
    // // Medium gaps (clamps between 12px and 24px)
    // final double mediumSpacing = (height * 0.03).clamp(12.0, 24.0);
    // Small gaps (clamps between 8px and 16px)
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
            text: "Let's build something great together.",
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
                  // "My greatest goal in life is to create useful apps that everyone with a smartphone can use.\nI can help you achieve your goals by helping me achieve mine.",
                  "I am passionate about engineering mobile applications that are as reliable under the hood as they are elegant on the screen. Let's connect and turn complex ideas into seamless digital solutions.",
              fontSize: kDefaultFontSize + 2,
              fontFamily: "Poppins",
              lineHeight: 1.8,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: (isAboveMinHeight) ? 24 : 12,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    MyText(text: "Contact Me On", fontFamily: "Poppins"),
                    linksLayoutChanger(
                      isLargeScreen: (isAboveMinHeight),
                      children: [
                        account(
                          icon: Icon(Icons.email, size: 24),
                          // text: "linogamil2003@gmail.com",
                          text: "dhetterjan@gmail.com",
                          onTap: () {
                            sendEmail(
                              email: 'linogamil2003@gmail.com',
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

                if (!isAboveMinHeight)
                  MyLine(
                    isHorizontal: false,
                    height: height * 0.14,
                    // color: Colors.grey,
                  ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    MyText(text: "Follow Me On", fontFamily: "Poppins"),
                    linksLayoutChanger(
                      isLargeScreen: (isAboveMinHeight),
                      children: [
                        account(
                          icon: Image.asset(
                            "assets/images/logo/github_logo.png",
                            width: 24,
                            // height: 24,
                          ),
                          text: "inogami-dev",
                          url: "https://github.com/inogami-dev",
                          isIntededToHideOnSmallerScreen: true,
                        ),
                        account(
                          icon: Image.asset(
                            (Theme.of(context).brightness == Brightness.dark)
                                ? "assets/images/logo/linked_in_logo_dark.png"
                                : "assets/images/logo/linked_in_logo.png",
                            width: 22,
                            // height: 24,
                          ),
                          // text: "Lino G. Gamil III",
                          text: "inogami",
                          url: "https://www.linkedin.com/in/lino-gamil-iii/",
                          isIntededToHideOnSmallerScreen: true,
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
            onTap: () {
              downloadResume(
                fileName: "Lino_Gamil_III_Mobile_App_Developer_Resume.pdf",
              );
            },
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
    bool isIntededToHideOnSmallerScreen = false,
    VoidCallback? onTap,
  }) {
    return Tooltip(
      message:
          (height > MySizeConstants.deskTopScreenMinHeight ||
              !isIntededToHideOnSmallerScreen)
          ? ""
          : text,
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
            if (height > MySizeConstants.deskTopScreenMinHeight ||
                !isIntededToHideOnSmallerScreen)
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
