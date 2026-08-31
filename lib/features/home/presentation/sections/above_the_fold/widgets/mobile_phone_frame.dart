import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';

class MyMobilePhoneFrame extends StatefulWidget {
  const MyMobilePhoneFrame({super.key});

  @override
  State<MyMobilePhoneFrame> createState() => _MyMobilePhoneFrameState();
}

class _MyMobilePhoneFrameState extends State<MyMobilePhoneFrame> {
  @override
  Widget build(BuildContext context) {
    double width = MyDimensions.width(context);
    double height = MyDimensions.height(context);

    return AspectRatio(
      aspectRatio: 9 / 20,
      child: Container(
        width: width * 0.15,
        height: height * 0.7,
        // constraints: BoxConstraints(maxHeight: height * 0.7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.symmetric(
            vertical: BorderSide(width: 2, color: Colors.grey.shade900),
            horizontal: BorderSide(width: 2, color: Colors.grey.shade900),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:my_portfolio/core/utilities/dimension.dart';

// class MyMobilePhoneFrame extends StatefulWidget {
//   const MyMobilePhoneFrame({super.key});

//   @override
//   State<MyMobilePhoneFrame> createState() => _MyMobilePhoneFrameState();
// }

// class _MyMobilePhoneFrameState extends State<MyMobilePhoneFrame> {
//   @override
//   Widget build(BuildContext context) {
//     // Only fetch the height from the global dimensions
//     double screenHeight = MyDimensions.height(context);

//     // Set the height of the phone frame
//     double frameHeight = screenHeight * 0.7;

//     // Calculate width based on a standard phone aspect ratio (e.g., 9:19.5 for modern phones)
//     double frameWidth = frameHeight * (9 / 19.5);

//     return Container(
//       width: frameWidth,
//       height: frameHeight,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: Colors.blueAccent,
//         border: Border.symmetric(
//           vertical: BorderSide(width: 2, color: Colors.grey.shade900),
//           horizontal: BorderSide(width: 2, color: Colors.grey.shade900),
//         ),
//         borderRadius: BorderRadius.circular(24),
//       ),
//     );
//   }
// }
