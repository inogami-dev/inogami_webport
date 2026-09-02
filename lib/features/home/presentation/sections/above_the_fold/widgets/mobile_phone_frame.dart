import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/widgets/mobile_phone_screen.dart';

class MyMobilePhoneFrame extends StatefulWidget {
  const MyMobilePhoneFrame({super.key});

  @override
  State<MyMobilePhoneFrame> createState() => _MyMobilePhoneFrameState();
}

class _MyMobilePhoneFrameState extends State<MyMobilePhoneFrame> {
  @override
  Widget build(BuildContext context) {
    ColorScheme myColorScheme = Theme.of(context).colorScheme;

    // We only need the screen height now. The width calculates itself.
    double height = MyDimensions.height(context);

    return Container(
      // Limit the height to 70% of the screen (providing natural padding around it)
      height: height * 0.7,
      alignment: Alignment.centerLeft,
      // color: Colors.amber,
      padding: EdgeInsets.only(left: 16),
      margin: EdgeInsets.only(top: 32),
      child: Row(
        // Wrap the row tightly so it doesn't stretch across the parent
        mainAxisSize: MainAxisSize.min,
        children: [
          // Lock the aspect ratio of the phone body ONLY
          AspectRatio(
            aspectRatio: 9 / 20, // Infinix GT 30 Pro ratio (1224x2720)
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(width: 2.5, color: Colors.grey.shade900),
                borderRadius: BorderRadius.circular(24),
              ),
              clipBehavior: Clip.hardEdge,
              child: MyMobilePhoneScreen(height: height, borderRadius: 24 - 2),
            ),
          ),
          // Side buttons attached immediately to the right
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sideButton(height: 24, colorScheme: myColorScheme),
              const SizedBox(height: 2),
              sideButton(height: 24, colorScheme: myColorScheme),
              const SizedBox(height: 16),
              sideButton(height: 32, colorScheme: myColorScheme),
              const SizedBox(height: 180), // Pushes buttons slightly higher
            ],
          ),
        ],
      ),
    );
  }

  Container sideButton({
    required double height,
    required ColorScheme colorScheme,
  }) {
    return Container(
      width: 2,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
        border: Border(
          right: BorderSide(
            width: 0.2,
            color: Colors.grey,
            // color: Colors.white,
          ),
        ),
      ),
    );
  }
}
