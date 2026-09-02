import 'package:flutter/material.dart';

class MyMobilePhoneScreen extends StatelessWidget {
  final double borderRadius;

  const MyMobilePhoneScreen({super.key, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.grab,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          children: [
            // Wallpaper / Screen Content (Fills 100% of the screen area without gaps)
            Image.asset('assets/images/me.webp', fit: BoxFit.cover),

            // Subtle glass glare reflection overlay on the screen glass
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withAlpha(20),
                        Colors.transparent,
                        Colors.white.withAlpha(5),
                      ],
                      stops: const [0.0, 0.4, 1.0],
                    ),
                  ),
                ),
              ),
            ),

            // Camera Punch-hole (Placed on top so it is never obscured by the image)
            Positioned(
              top: 8,
              child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: const Color(0xFF0A0A0E),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF1E2028),
                    width: 0.8,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(150),
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 3,
                    height: 3,
                    decoration: const BoxDecoration(
                      color: Color(
                        0xFF1A3050,
                      ), // Subtle blue-tinted camera lens reflection
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
