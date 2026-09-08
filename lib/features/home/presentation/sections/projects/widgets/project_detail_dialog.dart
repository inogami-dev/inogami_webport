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
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // Responsive width: Up to 800px on desktop, but fits comfortably on smaller screens
              maxWidth: screenWidth * ((isFullScreen) ? 1 : 0.85), // 850
              minWidth: 320.0,
              maxHeight:
                  screenHeight *
                  ((isFullScreen)
                      ? 1
                      : 0.85), // Never overflows the browser viewport
            ),
            child: Container(
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
                        // child: Text(
                        //   title,
                        //   style: TextStyle(
                        //     fontSize: 24,
                        //     fontWeight: FontWeight.bold,
                        //     fontFamily: "Poppins",
                        //     color: colorScheme.onSurface,
                        //   ),
                        // ),
                        child: MyText(
                          text: title,
                          fontSize: kDefaultFontSize + 8,
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (contentWidget != null) ...[
                            contentWidget,
                            const SizedBox(height: 16),
                          ],
                          // Text(
                          //   fullDescription,
                          //   style: TextStyle(
                          //     fontSize: 16,
                          //     height: 1.6,
                          //     color: colorScheme.onSurface.withAlpha(200),
                          //     fontFamily: "Quicksand",
                          //   ),
                          // ),
                          MyText(text: fullDescription),
                        ],
                      ),
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
