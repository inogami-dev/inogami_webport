// import 'package:flutter/material.dart';
// import 'package:my_portfolio/core/widgets/text.dart';

// class MyNavbarButton extends StatefulWidget {
//   final String text;
//   final VoidCallback onTap;
//   final double? width;
//   final bool isUsedAsCTAButton;
//   const MyNavbarButton({
//     super.key,
//     required this.text,
//     required this.onTap,
//     this.width,
//     this.isUsedAsCTAButton = false,
//   });

//   @override
//   State<MyNavbarButton> createState() => _MyNavbarButtonState();
// }

// class _MyNavbarButtonState extends State<MyNavbarButton> {
//   bool isHovered = false;
//   Color? buttonColor;
//   double buttonShrinkFx = 4;

//   @override
//   Widget build(BuildContext context) {
//     double? effectiveWidth = widget.width;

//     final myColorScheme = Theme.of(context).colorScheme;
//     if (widget.isUsedAsCTAButton) {
//       buttonColor ??= myColorScheme.primary;
//       if (effectiveWidth != null) {
//         effectiveWidth -= buttonShrinkFx;
//       }
//     }

//     return GestureDetector(
//       onTap: widget.onTap,
//       child: MouseRegion(
//         cursor: SystemMouseCursors.click,
//         onEnter: (event) => setState(() => isHovered = true),
//         onExit: (event) => setState(() => isHovered = false),
//         child: AnimatedContainer(
//           width: effectiveWidth,
//           duration: Duration(milliseconds: 200),
//           curve: Curves.easeInOut,
//           margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
//           padding: EdgeInsets.symmetric(horizontal: 8),
//           clipBehavior: Clip.hardEdge,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: (isHovered)
//                 ? myColorScheme.primaryContainer
//                 // : myColorScheme.surface,
//                 : buttonColor,
//             borderRadius: BorderRadius.circular(50),
//             // boxShadow:
//             //     // isHovered ?
//             //     [
//             //       if (isHovered)
//             //         BoxShadow(
//             //           color: Colors.blueAccent.withAlpha(56),
//             //           blurRadius: 4,
//             //           offset: const Offset(0, 0),
//             //         ),
//             //     ],
//             // // : [], // Remove shadow when not hovered
//           ),
//           child: MyText(
//             text: widget.text,
//             fontWeight: (isHovered) ? FontWeight.w600 : FontWeight.w400,
//             color: (isHovered)
//                 ? myColorScheme.onSurfaceVariant
//                 : myColorScheme.onSurface,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class MyNavbarButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  final bool isUsedAsCTAButton;
  final bool isSelected;

  const MyNavbarButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.isUsedAsCTAButton = false,
    this.isSelected = false,
  });

  @override
  State<MyNavbarButton> createState() => _MyNavbarButtonState();
}

class _MyNavbarButtonState extends State<MyNavbarButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;

    final Color textColor = widget.isUsedAsCTAButton
        ? Colors.white
        : myColorScheme.onSurface;
    // widget.isUsedAsCTAButton
    //     ? Colors.white
    //     : (isHovered ? colorScheme.primary : colorScheme.onSurface);

    final Color bgColor = widget.isUsedAsCTAButton
        ? (isHovered
              ? myColorScheme.primary.withAlpha(200)
              : myColorScheme.primary)
        : (isHovered ? myColorScheme.primaryContainer : Colors.transparent);

    final FontWeight textWeight = widget.isUsedAsCTAButton
        ? FontWeight.w600
        : (isHovered ? FontWeight.w600 : FontWeight.w400);

    final double targetScale = (widget.isUsedAsCTAButton && isHovered)
        ? 0.95
        : 1.0;

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedScale(
          scale: targetScale,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            width: widget.width,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            // 2. FIXED PADDING: Removed vertical padding and Clip.hardEdge so text centers perfectly
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(50),
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: (widget.isSelected)
                      ? myColorScheme.primary
                      : Colors.transparent,
                ),
              ),
            ),
            child: MyText(
              text: widget.text,
              fontWeight: textWeight,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
