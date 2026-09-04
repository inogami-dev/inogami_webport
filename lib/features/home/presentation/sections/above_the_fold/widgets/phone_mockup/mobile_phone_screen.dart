import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/image_gallery.dart';

class MyMobilePhoneScreen extends StatelessWidget {
  final double borderRadius;

  const MyMobilePhoneScreen({super.key, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenH = constraints.maxHeight;

        // Proportional camera punch-hole sizing based on actual screen height
        final double cameraSize = (screenH * 0.018).clamp(5.0, 11.0);
        final double cameraTop = (screenH * 0.014).clamp(4.0, 10.0);
        final double lensSize = cameraSize * 0.35;

        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: [
              // 1. Wallpaper / Screen Content with Gallery
              const MyImageGallery(
                images: ['assets/images/me.webp', 'assets/images/me2.webp'],
              ),

              // 2. Subtle glass glare reflection overlay
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

              // 3. Camera Punch-hole (Scales proportionally with screen size)
              Positioned(
                top: cameraTop,
                child: Container(
                  width: cameraSize,
                  height: cameraSize,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A0A0E),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF1E2028),
                      width: (cameraSize * 0.09).clamp(0.5, 1.0),
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
                      width: lensSize,
                      height: lensSize,
                      decoration: const BoxDecoration(
                        color: Color(
                          0xFF1A3050,
                        ), // Subtle camera lens reflection
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
