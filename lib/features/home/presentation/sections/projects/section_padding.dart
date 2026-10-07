import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/features/home/domain/my_extensions/build_context_extension.dart';

class MySectionPadding extends StatelessWidget {
  final Widget child;
  final double width;
  final double? height; // Made nullable so it can be omitted if desired
  final EdgeInsetsGeometry? padding;
  final double? topPadding;
  final Color? color;
  final Widget? linkToExtraContent;
  final CrossAxisAlignment contentAlignment;

  const MySectionPadding({
    super.key,
    required this.child,
    required this.width,
    this.height,
    this.padding,
    this.topPadding,
    this.color,
    this.linkToExtraContent,
    this.contentAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    // Constraint check
    if (topPadding != null && padding != null) {
      throw Exception(
        'Cannot provide both padding and topPadding. Please provide only either one of them.',
      );
    }

    final bool isMobile = context.isMobile;

    // ---------------------------------------------------------------------------
    // ADAPTIVE HEIGHT & EXPANDED BEHAVIOR
    // - On Desktop/Tablet: Uses the passed height so full-page snap scrolling works.
    // - On Mobile: Sets height to null so the section hugs its children naturally.
    // ---------------------------------------------------------------------------
    final double? effectiveHeight = isMobile ? null : height;

    return Container(
      width: width,
      height: effectiveHeight,
      color: color,
      // On mobile, use clean vertical padding instead of desktop top navbar padding
      padding: isMobile
          ? const EdgeInsets.symmetric(vertical: 24.0)
          : padding ?? EdgeInsets.only(top: topPadding ?? 0),
      child: Column(
        // On mobile: hugs children tightly (MainAxisSize.min)
        // On desktop: fills the entire fixed screen height (MainAxisSize.max)
        mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
        crossAxisAlignment: contentAlignment,
        children: [
          // On mobile: Child takes its natural content size (NO Expanded!)
          // On desktop: Expanded forces child to fill the full section height
          if (isMobile) child else Expanded(child: child),

          // Optional link at the bottom (e.g. GitHub link)
          if (linkToExtraContent != null)
            Padding(
              padding: EdgeInsets.only(
                left: isMobile
                    ? 20.0
                    : MySizeConstants.genericHorizontalPadding,
                top: isMobile ? 12.0 : 0.0,
              ),
              child: linkToExtraContent,
            ),
        ],
      ),
    );
  }
}
