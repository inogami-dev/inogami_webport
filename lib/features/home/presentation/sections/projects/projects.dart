import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/projects/widgets/project_card.dart';

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
      // color: Colors.orange,
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: MyProjectCard(
              screenHeight: screenHeight,
              widthPerProject: widthPerProject,
              title: "Project 1",
              description:
                  "Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight. Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight. Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight.",
              fullDescription: "World",
              contentWidget: Container(
                width: width,
                height: screenHeight,
                decoration: BoxDecoration(
                  color: myColorScheme.primary,
                  border: BoxBorder.all(width: 2, color: Colors.amber),
                ),
                child: MyText(text: "Dart"),
              ),
            ),
          ),
          Expanded(
            child: MyProjectCard(
              screenHeight: screenHeight,
              widthPerProject: widthPerProject,
              title: "Project 2",
              description:
                  "Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight. Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight. Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight.",
              fullDescription: "World2",
            ),
          ),
          Expanded(
            child: MyProjectCard(
              screenHeight: screenHeight,
              widthPerProject: widthPerProject,
              title: "Project 3",
              description:
                  "Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight. Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight. Description for Project 1 goes here. It can be a brief summary of the project, its features, and any other relevant information that you want to highlight.",
              fullDescription: "World 3",
            ),
          ),
        ],
      ),
    );
  }
}
