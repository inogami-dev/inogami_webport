import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class MyHeaderButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const MyHeaderButton({super.key, required this.text, required this.onTap});

  @override
  State<MyHeaderButton> createState() => _MyHeaderButtonState();
}

class _MyHeaderButtonState extends State<MyHeaderButton> {
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
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 8),
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: (isHovered)
                ? myColorScheme.surfaceContainerLow.withAlpha(56)
                : myColorScheme.surface,
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Colors.blueAccent.withAlpha(56),
                      blurRadius: 12,
                      offset: const Offset(0, 0),
                    ),
                  ]
                : [], // Remove shadow when not hovered
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
