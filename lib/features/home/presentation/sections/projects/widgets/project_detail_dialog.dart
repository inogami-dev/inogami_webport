import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/core/widgets/text.dart';

void showMyProjectDetailModal({
  required BuildContext context,
  required String title,
  required String fullDescription,
  Widget? contentWidget,
  double? width,
  double? height,
  bool isFullScreen = false,
}) {
  final ColorScheme colorScheme = Theme.of(context).colorScheme;

  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withAlpha(160), // Dark backdrop blur/dim
    builder: (context) {
      final double screenWidth = width ?? MyDimensions.width(context);
      final double screenHeight = height ?? MyDimensions.height(context);
      const double minimumDialogHeight = 420;
      final double calculatedDialogHeight =
          screenHeight * (isFullScreen ? 0.9 : 0.75);
      // Guaranteed height ceiling (never lower than 420):
      final double effectiveDialogHeight = math.max(
        calculatedDialogHeight,
        minimumDialogHeight,
      );

      Dialog dialog = Dialog(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            // Responsive width: Up to 800px on desktop, but fits comfortably on smaller screens
            maxWidth: screenWidth * ((isFullScreen) ? 1 : 0.85), // 850
            minWidth: 320.0,
            maxHeight: effectiveDialogHeight,
            minHeight: minimumDialogHeight,
          ),
          child: Container(
            width: screenWidth,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.outlineVariant.withAlpha(80),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(100),
                  blurRadius: 32,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            // padding: const EdgeInsets.all(24),
            // padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 42),
            padding: const EdgeInsets.fromLTRB(42, 28, 32, 42),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Title & Close Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyText(
                        text: title,
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

                // Scrollable Content Area (Descriptions, Previews, Mockups)
                Flexible(
                  child: Row(
                    children: [
                      // The Phone
                      SizedBox(width: screenWidth * 0.20, child: contentWidget),

                      Expanded(
                        child: SingleChildScrollView(
                          child: MyText(text: fullDescription, maxLines: 32),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      if (calculatedDialogHeight < minimumDialogHeight) {
        return Center(child: SingleChildScrollView(child: dialog));
      } else {
        return Center(child: dialog);
      }
    },
  );
}
