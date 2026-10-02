import 'dart:ui';

import 'package:flutter/material.dart';

class MyDrawerButton extends StatelessWidget {
  const MyDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme myColorScheme = Theme.of(context).colorScheme;

    return ClipOval(
      // borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        // Blurs whatever is behind the button
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Material(
          // Translucent glass tint (allows the blur + ripple to show through)
          color: myColorScheme.surface.withAlpha(80),
          shape: CircleBorder(
            // borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: myColorScheme.outlineVariant.withAlpha(64),
              width: 1,
            ),
          ),
          // InkWell gives you the full, smooth ripple effect
          child: InkWell(
            onTap: () {
              // Scaffold.of(context).openDrawer();
              Scaffold.of(context).openEndDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.menu, color: myColorScheme.onSurface),
            ),
          ),
        ),
      ),
    );
  }
}
