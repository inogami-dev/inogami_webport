import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/data/model/project_model.dart';
import 'package:my_portfolio/features/home/domain/my_extensions/build_context_extension.dart';
import 'package:my_portfolio/features/home/presentation/sections/projects/widgets/project_content_side.dart';

void showMyProjectDetailModal({
  required BuildContext context,
  // required String title,
  // required String fullDescription,
  // List<String>? techStackImages,
  required MyProjectModel project,
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

      final bool isMobile = context.isMobile;

      // // Header with Title & Close Button
      // final Widget titleBar = Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Expanded(
      //       child: MyText(
      //         text: project.title,
      //         fontSize: kDefaultFontSize + 8,
      //         fontFamily: "Poppins",
      //         fontWeight: FontWeight.w600,
      //         textOverFlow: TextOverflow.ellipsis,
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () => Navigator.of(context).pop(),
      //       icon: const Icon(Icons.close_rounded),
      //       tooltip: 'Close',
      //     ),
      //   ],
      // );

      final List<Widget> dialogContents = [
        // This Mobile Phone Widget only appears in mobile view, and is placed above the titleBar in the dialogContents list.
        if (contentWidget != null) ...[if (!isMobile) contentWidget],

        // Scrollable Content Area (Descriptions, Previews, Mockups)
        Expanded(
          child: Column(
            children: [
              // Header with Title & Close Button for non-mobile view
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MyText(
                      text: project.title,
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: MyText(
              //         text: project.title,
              //         fontSize: kDefaultFontSize + 8,
              //         fontFamily: "Poppins",
              //         fontWeight: FontWeight.w600,
              //         textOverFlow: TextOverflow.ellipsis,
              //       ),
              //     ),
              //     IconButton(
              //       onPressed: () => Navigator.of(context).pop(),
              //       icon: const Icon(Icons.close_rounded),
              //       tooltip: 'Close',
              //     ),
              //   ],
              // ),
              if (!isMobile) const SizedBox(height: 16),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: MyProjectContentSide(
                        mobileViewWidget: contentWidget,
                        height: effectiveDialogHeight,
                        // fullDescription: project.fullDescription,
                        // techStackImages: project.techStackImages,
                        project: project,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ];

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
            padding: const EdgeInsets.fromLTRB(36, 28, 32, 32),
            child: (isMobile)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: dialogContents,
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24,
                    children: dialogContents,
                  ),
          ),
        ),
      );

      if (calculatedDialogHeight < minimumDialogHeight) {
        return Center(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: dialog,
          ),
        );
      } else {
        return Center(child: dialog);
      }
    },
  );
}
