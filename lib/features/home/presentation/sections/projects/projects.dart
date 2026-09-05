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
    final ColorScheme myColorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      height: screenHeight,
      color: Colors.orange,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: projectCard(
              title: "Project 1",
              description:
                  "Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight. Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight. Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight.",
              widthPerProject: widthPerProject,
              myColorScheme: myColorScheme,
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
    required ColorScheme myColorScheme,
  }) {
    return Container(
      width: widthPerProject,
      height: screenHeight,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: myColorScheme.shadow.withAlpha(56),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: widthPerProject,
            // height: screenHeight * 0.56,
            color: Colors.red,
            alignment: Alignment.center,
            child: MyMobilePhoneFrame(
              alignment: Alignment.center,
              heightPercentage: 0.4,
            ),
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
}
