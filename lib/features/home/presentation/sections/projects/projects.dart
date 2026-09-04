import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/widgets/phone_mockup/mobile_phone_frame.dart';

class MyProjectsSection extends StatelessWidget {
  final double screenHeight;
  final String sectionTitle;

  const MyProjectsSection({
    super.key,
    required this.screenHeight,
    required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MyDimensions.width(context);
    final double widthPerProject = width / 3;
    return Container(
      width: width,
      height: screenHeight,
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: projectCard(
              title: "Project 1",
              description:
                  "Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight. Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight. Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight.",
              widthPerProject: widthPerProject,
            ),
          ),
          Expanded(
            child: Container(
              height: screenHeight,
              color: Colors.purple,
              child: MyMobilePhoneFrame(),
            ),
          ),
          Expanded(
            child: Container(
              height: screenHeight,
              color: Colors.blue,
              child: MyMobilePhoneFrame(),
            ),
          ),
        ],
      ),
    );
  }

  Container projectCard({
    required double widthPerProject,
    required String title,
    required String description,
  }) {
    return Container(
      width: widthPerProject,
      height: screenHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: widthPerProject,
            height: screenHeight * 0.56,
            color: Colors.red,
            alignment: Alignment.center,
            child: MyMobilePhoneFrame(alignment: Alignment.center),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 8),
            child: MyText(
              text: title,
              fontSize: kDefaultFontSize + 4,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
              maxLines: 3,
            ),
          ),
          Expanded(
            child: MyText(
              text: description,
              maxLines: 6,
              textOverFlow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  //// For later exploration
  // void calculateScreenPixel() {
  //   if (key != null) {
  //       final RenderBox box =
  //           key.currentContext!.findRenderObject() as RenderBox;
  //
  //       // Find the Y position of the section relative to the top of the viewport
  //       final Offset position = box.localToGlobal(Offset.zero);
  //       final double topY = position.dy;
  //       final double bottomY = topY + box.size.height;
  //
  //       // If the detection line is inside this section's boundaries
  //       if (topY <= detectionLine && bottomY > detectionLine) {
  //         // Only update if it actually changed to avoid unnecessary work
  //         if (activeSectionNotifier.value != entry.key) {
  //           activeSectionNotifier.value = entry.key;
  //         }
  //         break; // Stop checking once we find the visible section
  //       }
  //     }
  // }
}
