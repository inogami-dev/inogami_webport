import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class MyNavbarButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  const MyNavbarButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
  });

  @override
  State<MyNavbarButton> createState() => _MyNavbarButtonState();
}

class _MyNavbarButtonState extends State<MyNavbarButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        // onHover: (event) {
        //   log("MOUSE HOVER on ${event.device}");
        // },
        onEnter: (event) => setState(() => isHovered = true),
        onExit: (event) => setState(() => isHovered = false),
        child: AnimatedContainer(
          width: widget.width,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 8),
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // color: (isHovered)
            //     ? myColorScheme.surfaceContainerLow.withAlpha(56)
            //     // : myColorScheme.surface,
            //     : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            boxShadow:
                // isHovered ?
                [
                  if (isHovered)
                    BoxShadow(
                      color: Colors.blueAccent.withAlpha(56),
                      blurRadius: 4,
                      offset: const Offset(0, 0),
                    ),
                ],
            // : [], // Remove shadow when not hovered
          ),
          child: MyText(
            text: widget.text,
            fontWeight: (isHovered) ? FontWeight.w600 : FontWeight.w400,
            color: (isHovered)
                ? myColorScheme.primary
                : myColorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
