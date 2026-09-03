import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/widgets/phone_mockup/mobile_phone_screen.dart';

class MyMobilePhoneFrame extends StatelessWidget {
  const MyMobilePhoneFrame({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    const double bezelWidth = 3.5;
    const double outerRadius = 28.0;
    const double innerRadius = outerRadius - bezelWidth;

    final double screenHeight = MyDimensions.height(context);

    return Container(
      height: screenHeight * 0.72,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 16),
      margin: const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Phone Body with Realistic Bezel & Shadow
          AspectRatio(
            aspectRatio:
                9 /
                20, // Modern tall phone ratio (Infinix GT 30 Pro / flagship ratio)
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0D0E12), // Sleek matte chassis
                borderRadius: BorderRadius.circular(outerRadius),
                border: Border.all(
                  width: bezelWidth,
                  color: const Color(0xFF16181F), // Uniform thin outer bezel
                ),
                boxShadow: [
                  // Phone ambient drop shadow
                  BoxShadow(
                    color: Colors.black.withAlpha(90),
                    blurRadius: 24,
                    offset: const Offset(4, 12),
                  ),
                  // Subtle chassis rim highlight
                  BoxShadow(
                    color: Colors.white.withAlpha(20),
                    blurRadius: 1,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: const MyMobilePhoneScreen(borderRadius: innerRadius),
            ),
          ),

          // Physical Hardware Side Buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _sideButton(
                height: 50,
                colorScheme: colorScheme,
              ), // Volume rocker
              const SizedBox(height: 12),
              _sideButton(height: 32, colorScheme: colorScheme), // Power button
              const SizedBox(
                height: 160,
              ), // Positions buttons naturally along top-right edge
            ],
          ),
        ],
      ),
    );
  }

  Widget _sideButton({
    required double height,
    required ColorScheme colorScheme,
  }) {
    return Container(
      width: 2.5,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1E26),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(3),
          bottomRight: Radius.circular(3),
        ),
        border: Border(
          right: BorderSide(width: 0.5, color: Colors.white.withAlpha(35)),
        ),
      ),
    );
  }
}
