// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:my_portfolio/core/utilities/dimension.dart';
// import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/widgets/phone_mockup/mobile_phone_screen.dart';

// class MyMobilePhoneFrame extends StatelessWidget {
//   final Alignment alignment;
//   final double heightPercentage;

//   const MyMobilePhoneFrame({
//     super.key,
//     this.alignment = Alignment.centerLeft,
//     this.heightPercentage = 0.70,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final ColorScheme colorScheme = Theme.of(context).colorScheme;

//     final double screenHeight = MyDimensions.height(context);
//     double sideButtonHeightPercentage = screenHeight * heightPercentage;
//     double sideButtonWidthPercentage = sideButtonHeightPercentage * 0.0056;
//     double bezelWidth = sideButtonHeightPercentage * 0.01; // 3.5 old value
//     double outerRadius =
//         sideButtonHeightPercentage *
//         0.056; // 28.0 old value // 0.014 for square phone
//     double innerRadius = outerRadius - bezelWidth;

//     if (screenHeight < 280) {
//       log("\nscreen height: $screenHeight < 280");
//       log("sideButtonHeightPercentage: $sideButtonHeightPercentage");
//       log("sideButtonWidthPercentage: $sideButtonWidthPercentage");
//       log("bezelWidth: $bezelWidth");
//       log("outerRadius: $outerRadius");
//       log("innerRadius: $innerRadius \n");
//       sideButtonHeightPercentage = 191;
//       sideButtonWidthPercentage = 1.07;
//       bezelWidth = 1.9;
//       outerRadius = 10.7;
//       innerRadius = 8.8;
//     }

//     return Container(
//       height: screenHeight * heightPercentage,
//       alignment: alignment,
//       padding: const EdgeInsets.only(left: 16),
//       margin: const EdgeInsets.only(top: 32),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Phone Body with Realistic Bezel & Shadow
//           AspectRatio(
//             aspectRatio:
//                 9 /
//                 20, // Modern tall phone ratio (Infinix GT 30 Pro / flagship ratio)
//             child: Container(
//               decoration: BoxDecoration(
//                 color: const Color(0xFF0D0E12), // Sleek matte chassis
//                 borderRadius: BorderRadius.circular(outerRadius),
//                 border: Border.all(
//                   width: bezelWidth,
//                   color: const Color(0xFF16181F), // Uniform thin outer bezel
//                 ),
//                 boxShadow: [
//                   // Phone ambient drop shadow
//                   BoxShadow(
//                     color: Colors.black.withAlpha(90),
//                     blurRadius: 24,
//                     offset: const Offset(4, 12),
//                   ),
//                   // Subtle chassis rim highlight
//                   BoxShadow(
//                     color: Colors.white.withAlpha(20),
//                     blurRadius: 1,
//                     spreadRadius: 0.5,
//                   ),
//                 ],
//               ),
//               child: MyMobilePhoneScreen(borderRadius: innerRadius),
//             ),
//           ),

//           // Physical Hardware Side Buttons
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Volume rocker
//               _sideButton(
//                 // height: (screenHeight * .72 > 210) ? 50 : 32,
//                 height: (sideButtonHeightPercentage * 0.12).clamp(12, 50),
//                 colorScheme: colorScheme,
//                 sideButtonWidthPercentage: sideButtonWidthPercentage,
//               ),
//               SizedBox(
//                 height: (sideButtonHeightPercentage * 0.02).clamp(4, 16),
//               ),
//               _sideButton(
//                 // height: (screenHeight * .72 > 210) ? 32 : 20,
//                 height: (sideButtonHeightPercentage * 0.08).clamp(8, 40),
//                 colorScheme: colorScheme,
//                 sideButtonWidthPercentage: sideButtonWidthPercentage,
//               ), // Power button
//               SizedBox(
//                 // height: (screenHeight * .72 > 210) ? 160 : 80,
//                 height: (sideButtonHeightPercentage * 0.18).clamp(24, 185),
//               ), // Positions buttons naturally along top-right edge
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _sideButton({
//     required double height,
//     required ColorScheme colorScheme,
//     double sideButtonWidthPercentage = 0.2,
//   }) {
//     return Container(
//       width: sideButtonWidthPercentage,
//       height: height,
//       decoration: BoxDecoration(
//         color: const Color(0xFF1C1E26),
//         borderRadius: const BorderRadius.only(
//           topRight: Radius.circular(3),
//           bottomRight: Radius.circular(3),
//         ),
//         border: Border(
//           right: BorderSide(width: 0.5, color: Colors.white.withAlpha(35)),
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/widgets/phone_mockup/mobile_phone_screen.dart';

class MyMobilePhoneFrame extends StatelessWidget {
  final Alignment alignment;
  final double heightPercentage;
  final double? explicitHeight; // Optional override

  const MyMobilePhoneFrame({
    super.key,
    this.alignment = Alignment.centerLeft,
    this.heightPercentage = 0.70,
    this.explicitHeight,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Use parent constraints if available, falling back to MediaQuery
        final double parentHeight = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : MyDimensions.height(context);

        // Single source of truth for the phone's height (enforcing a minimum of 191)
        final double phoneHeight =
            explicitHeight ??
            (parentHeight * heightPercentage).clamp(191.0, 1000.0);

        // All geometry scales proportionally from phoneHeight
        final double buttonWidth = (phoneHeight * 0.0056).clamp(1.0, 4.0);
        final double bezelWidth = (phoneHeight * 0.01).clamp(1.5, 4.0);
        final double outerRadius = phoneHeight * 0.056;
        final double innerRadius = (outerRadius - bezelWidth).clamp(
          0.0,
          double.infinity,
        );

        return Container(
          height: phoneHeight, // Uses the clamped, guaranteed height
          alignment: alignment,
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Phone Body
              AspectRatio(
                aspectRatio: 9 / 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D0E12),
                    borderRadius: BorderRadius.circular(outerRadius),
                    border: Border.all(
                      width: bezelWidth,
                      color: const Color(0xFF16181F),
                    ),
                    boxShadow: [
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
                  child: MyMobilePhoneScreen(borderRadius: innerRadius),
                ),
              ),

              // Physical Hardware Side Buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Volume rocker
                  _sideButton(
                    height: (phoneHeight * 0.12).clamp(12.0, 50.0),
                    colorScheme: colorScheme,
                    buttonWidth: buttonWidth,
                  ),
                  SizedBox(height: (phoneHeight * 0.02).clamp(2.0, 8.0)),
                  // Power button
                  _sideButton(
                    height: (phoneHeight * 0.08).clamp(8.0, 32.0),
                    colorScheme: colorScheme,
                    buttonWidth: buttonWidth,
                  ),
                  // Bottom offset spacer scales with phoneHeight
                  SizedBox(height: (phoneHeight * 0.32).clamp(20.0, 120.0)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _sideButton({
    required double height,
    required ColorScheme colorScheme,
    required double buttonWidth,
  }) {
    return Container(
      width: buttonWidth,
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
