import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/widgets/button.dart';
import 'package:my_portfolio/core/widgets/line.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/data/repository/copy_to_clipboard.dart';
import 'package:my_portfolio/features/home/data/repository/download_resume.dart';
import 'package:my_portfolio/features/home/data/repository/email_to.dart';
import 'package:my_portfolio/features/home/data/repository/link_opener.dart';
import 'package:my_portfolio/features/home/domain/my_extensions/build_context_extension.dart';

class MyFooterSection extends StatelessWidget {
  final double width;
  final double height;

  const MyFooterSection({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;
    final isMobile = context.isMobile;
    final isTablet = context.isTablet;

    // -------------------------------------------------------------------------
    // RESPONSIVE BREAKPOINTS & CONDITIONAL FLAGS
    // -------------------------------------------------------------------------

    // Whether screen height is taller than the minimum desktop threshold (420px)
    final bool isAboveMinHeight =
        height > MySizeConstants.deskTopScreenMinHeight;

    // Large vertical gaps that smoothly scale with screen height (16px to 48px)
    final double largeSpacing = (height * 0.056).clamp(16.0, 48.0);
    // Small vertical gaps (8px to 16px)
    final double smallSpacing = (height * 0.015).clamp(8.0, 16.0);

    // Reading width for subtitle text:
    // - Mobile: 90% (needs horizontal room on small displays)
    // - Tablet/Desktop: 65% (prevents lines from becoming too long to read)
    final double textContentWidth = isMobile ? width * 0.90 : width * 0.65;

    // Width allocated for the contacts & social section:
    // - Mobile: 92% (gives the long email button enough width to avoid overflow)
    // - Tablet: 85% (gives the horizontal Row enough room to fit side-by-side)
    // - Desktop: 65% (compact and centered on wide monitors)
    final double accountsContainerWidth = isMobile
        ? width * 0.92
        : (isTablet ? width * 0.85 : width * 0.65);

    // Headline font size: Scaled down on mobile to avoid taking 4-5 lines
    final double headlineFontSize = kDefaultFontSize + (isMobile ? 12 : 24);

    // -------------------------------------------------------------------------
    // ROOT LAYOUT
    // - Desktop/Tablet: height: height with Spacers to center vertically.
    // - Mobile: height: null with vertical padding so it takes natural height
    //   and avoids vertical clipping when virtual keyboards or small screens exist.
    // -------------------------------------------------------------------------
    return Container(
      width: width,
      height: isMobile ? null : height,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.0 : MySizeConstants.genericHorizontalPadding,
        // vertical: isMobile ? 36.0 : 0.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top buffer (only active on Desktop/Tablet)
          // if (!isMobile) const Spacer(),
          if (!isMobile) const Spacer(),
          if (isMobile) SizedBox(height: largeSpacing),

          // --- SECTION TITLE ---
          MyText(
            text: "Let's build something great together.",
            fontSize: headlineFontSize,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
            lineHeight: 1.15,
            maxLines: 4,
          ),
          // SizedBox(height: isMobile ? 14 : largeSpacing),
          SizedBox(height: largeSpacing),

          // --- SUBTITLE / STATEMENT ---
          SizedBox(
            width: textContentWidth,
            child: MyText(
              text: (height > 420)
                  ? "I am passionate about engineering mobile applications that are as reliable under the hood as they are elegant on the screen. Let's connect and turn complex ideas into seamless digital solutions."
                  : "I am a passionate developer, especially when it comes to UIUX.",
              fontSize: kDefaultFontSize + 2,
              fontFamily: "Poppins",
              lineHeight: isMobile ? 1.35 : 1.6,
              textAlign: TextAlign.center,
              maxLines: 6,
            ),
          ),
          // SizedBox(height: isMobile ? 22 : largeSpacing),
          SizedBox(height: largeSpacing),

          // --- CONTACTS & SOCIAL LINKS ---
          SizedBox(
            width: accountsContainerWidth,
            child: isMobile
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: myAccountsList(
                      context: context,
                      isAboveMinHeight: isAboveMinHeight,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: isAboveMinHeight ? 24 : 12,
                    children: myAccountsList(
                      context: context,
                      isAboveMinHeight: isAboveMinHeight,
                    ),
                  ),
          ),
          // SizedBox(height: isMobile ? largeSpacing : largeSpacing),
          if (context.screenHeight > 420) SizedBox(height: largeSpacing),
          if (!isMobile && context.screenHeight < 420)
            SizedBox(height: smallSpacing),

          // --- DOWNLOAD RESUME BUTTON ---
          MyButton(
            buttonText: "Download Resume",
            buttonTextColor: Colors.white,
            buttonTextFontSize: kDefaultFontSize + ((width > 1160) ? 2 : 0),
            buttonTextFontWeight: FontWeight.w600,
            buttonTextFontFamily: "Quicksand",
            widthPercentage: buttonWidth(context),
            borderWidth: 1,
            onTap: () {
              downloadResume(
                fileName: "Lino_Gamil_III_Mobile_App_Developer_Resume.pdf",
              );
            },
          ),

          // Bottom buffer (only active on Desktop/Tablet)
          // if (!isMobile) const Spacer(),
          // if (isMobile) const SizedBox(height: 32),
          if (!isMobile) const Spacer(),
          if (isMobile) SizedBox(height: largeSpacing),

          // --- COPYRIGHT FOOTER ---
          MyText(
            text:
                "Designed and built with love from scratch using Flutter Web • 2026",
            fontSize: isMobile ? kDefaultFontSize - 2 : kDefaultFontSize,
            color: myColorScheme.outline,
            textAlign: TextAlign.center,
          ),

          if (!isMobile) SizedBox(height: smallSpacing),
          if (isMobile) SizedBox(height: 8),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // RESPONSIVE BUTTON WIDTH
  // - Mobile: 0.60 (~215px on a 360px phone) ensures "Download Resume" fits without truncation.
  // - Tablet: 0.28 (~210px on a 750px tablet).
  // - Desktop: 0.16 (compact, elegant tap target on wide monitors).
  // ---------------------------------------------------------------------------
  double buttonWidth(BuildContext context) {
    if (context.isMobile) {
      return 0.60;
    } else if (context.isTablet) {
      return 0.28;
    } else {
      return 0.16;
    }
  }

  // ---------------------------------------------------------------------------
  // ACCOUNTS LIST (CONTACTS + SOCIALS)
  // ---------------------------------------------------------------------------
  List<Widget> myAccountsList({
    required BuildContext context,
    required bool isAboveMinHeight,
  }) {
    final isMobile = context.isMobile;

    return [
      // GROUP A: DIRECT CONTACTS
      Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        spacing: 8,
        children: [
          const MyText(text: "Contact Me On", fontFamily: "Poppins"),
          accountsLinksLayoutChanger(
            isLargeScreen: isAboveMinHeight && !isMobile,
            children: [
              account(
                icon: const Icon(Icons.email, size: 24),
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
                icon: const Icon(Icons.phone, size: 24),
                text: "09703647429",
                onTap: () {
                  copyToClipboard(context, "09703647429");
                },
              ),
            ],
          ),
        ],
      ),

      // DIVIDER:
      // - Shorter desktop: Vertical divider line
      // - Mobile: Horizontal spacing
      if (!isAboveMinHeight && !isMobile && context.screenHeight > 420)
        MyLine(isHorizontal: false, height: height * 0.14),
      // if (isMobile) MyLine(isHorizontal: true, height: width * 0.8),
      const SizedBox(height: 24),

      // GROUP B: SOCIAL PROFILES
      if (context.screenHeight > 420)
        Column(
          crossAxisAlignment: isMobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          spacing: 8,
          children: [
            const MyText(text: "Follow Me On", fontFamily: "Poppins"),
            accountsLinksLayoutChanger(
              isLargeScreen: isAboveMinHeight && !isMobile,
              children: [
                account(
                  icon: Image.asset(
                    "assets/images/logo/github_logo.png",
                    width: 22,
                  ),
                  text: "inogami-dev",
                  url: "https://github.com/inogami-dev",
                  isIntededToHideOnSmallerScreen: true,
                ),
                if (!isMobile) const SizedBox(height: 1),
                account(
                  icon: Image.asset(
                    (Theme.of(context).brightness == Brightness.dark)
                        ? "assets/images/logo/linked_in_logo_dark.png"
                        : "assets/images/logo/linked_in_logo.png",
                    width: 20,
                  ),
                  text: "inogami",
                  url: "https://www.linkedin.com/in/lino-gamil-iii/",
                  isIntededToHideOnSmallerScreen: true,
                ),
              ],
            ),
          ],
        ),
    ];
  }

  // ---------------------------------------------------------------------------
  // INTERACTIVE ACCOUNT BUTTON (WITH TOOLTIP FALLBACK)
  // ---------------------------------------------------------------------------
  Tooltip account({
    required Widget icon,
    required String text,
    String? url,
    bool isIntededToHideOnSmallerScreen = false,
    VoidCallback? onTap,
  }) {
    // When viewport is too short, hide text labels and show tooltips instead
    final bool shouldHideText =
        (height <= MySizeConstants.deskTopScreenMinHeight) &&
        isIntededToHideOnSmallerScreen;

    return Tooltip(
      message: shouldHideText ? text : "",
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed:
            onTap ??
            () async {
              if (url == null) return;
              await openLink(url);
            },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            icon,
            if (!shouldHideText)
              MyText(text: text, textOverFlow: TextOverflow.fade),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // LAYOUT CHANGER
  // - Large Screen: Column (vertical stack of buttons)
  // - Short / Mobile: Wrap (horizontal buttons that wrap if space runs out,
  //   preventing RenderFlex overflow on small screens)
  // ---------------------------------------------------------------------------
  Widget accountsLinksLayoutChanger({
    required bool isLargeScreen,
    required List<Widget> children,
  }) {
    if (isLargeScreen) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: children,
      );
    } else {
      return Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 4,
        children: children,
      );
    }
  }
}
