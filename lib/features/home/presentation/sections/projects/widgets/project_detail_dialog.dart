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
  final double screenWidth = width ?? MyDimensions.width(context);
  final double screenHeight = height ?? MyDimensions.height(context);

  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withAlpha(160), // Dark backdrop blur/dim
    builder: (context) {
      return Center(
        child: Dialog(
          // backgroundColor: Theme.of(
          //   context,
          // ).colorScheme.inverseSurface, // Allows custom decoration

          // insetPadding: const EdgeInsets.symmetric(
          //   horizontal: 24,
          //   vertical: 32,
          // ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // Responsive width: Up to 800px on desktop, but fits comfortably on smaller screens
              maxWidth: screenWidth * ((isFullScreen) ? 1 : 0.85), // 850
              minWidth: 320.0,
              maxHeight: screenHeight * ((isFullScreen) ? 1 : 0.85),
            ),
            child: Container(
              width: screenWidth,
              height: screenHeight,
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
              padding: const EdgeInsets.all(24),
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
                        SizedBox(
                          width: screenHeight * 0.5,
                          child: contentWidget,
                        ),
                        // if (contentWidget != null) ...[
                        //   contentWidget,
                        //   // const SizedBox(height: 16),
                        // ],
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
        ),
      );
    },
  );
}
