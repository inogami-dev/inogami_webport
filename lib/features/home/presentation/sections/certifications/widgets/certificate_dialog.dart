import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/core/widgets/hero.dart';
import 'package:my_portfolio/core/widgets/text.dart';

void showMyCertificateModal({
  required BuildContext context,
  required String certificateImage,
  double? width,
  double? height,
  bool isFullScreen = false,
}) {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false, // 1. Keeps background visible like a dialog
      barrierDismissible: true, // 2. Tapping background closes it
      barrierColor: Colors.black.withAlpha(160), // 3. Dimmed backdrop
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) {
        final double screenWidth = width ?? MyDimensions.width(context);
        final double screenHeight = height ?? MyDimensions.height(context);
        const double minimumDialogHeight = 420;
        final double calculatedDialogHeight =
            screenHeight * (isFullScreen ? 0.95 : 0.8);
        final double effectiveDialogHeight = math.max(
          calculatedDialogHeight,
          minimumDialogHeight,
        );

        final certificateName = certificateImage
            .split("/")
            .last
            .split(".")
            .first;

        Widget dialogContent = Dialog(
          backgroundColor: Colors.transparent, // Clean edges for the Hero
          insetPadding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth * (isFullScreen ? 1.0 : 0.85),
              minWidth: 320.0,
              maxHeight: effectiveDialogHeight,
              minHeight: minimumDialogHeight,
            ),
            child: MyHero(
              tag: certificateImage,
              child: Container(
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.outlineVariant.withAlpha(80),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(100),
                      blurRadius: 32,
                      offset: const Offset(0, 16),
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(36, 20, 32, 32),
                child: Column(
                  // Note: Remove any outer 'Expanded' here!
                  children: [
                    // Header with Title & Close Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MyText(
                            text: certificateName,
                            fontSize: kDefaultFontSize + 8,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            textOverFlow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close_rounded),
                          tooltip: 'Close',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Flexible(child: Image.asset(certificateImage)),
                  ],
                ),
              ),
            ),
          ),
        );

        return Center(child: dialogContent);
      },
    ),
  );
}
