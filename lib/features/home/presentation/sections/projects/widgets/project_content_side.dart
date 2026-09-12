import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/line.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/data/model/project_model.dart';

class MyProjectContentSide extends StatelessWidget {
  final double height;
  final MyProjectModel project;

  const MyProjectContentSide({
    super.key,
    required this.height,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Header
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: MyText(
              text: "What is ${project.title}:",
              fontSize: kDefaultFontSize - 3,
              fontFamily: "Poppins",
            ),
          ),

          // Full Description
          MyText(text: project.fullDescription, maxLines: 100),

          if (project.features != null) ...[
            SizedBox(height: 16),
            MyLine(),

            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: MyText(
                text: "Features:",
                fontSize: kDefaultFontSize - 3,
                fontFamily: "Poppins",
              ),
            ),
            // Using a for loop renders all items in full without a nested scrollbar:
            for (int i = 0; i < project.features!.length; i++)
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                title: Row(
                  spacing: 12,
                  children: [
                    Icon(
                      Icons.star_half_rounded,
                      color: Colors.blue.shade600.withAlpha(180),
                    ),
                    Expanded(
                      child: MyText(text: project.features![i], maxLines: 32),
                    ),
                  ],
                ),
                // subtitle: Padding(
                //   padding: const EdgeInsets.only(top: 8, bottom: 8),
                //   child: Row(
                //     spacing: 12,
                //     children: [
                //       Icon(
                //         Icons.check_circle_outline_rounded,
                //         color: Colors.green.shade400,
                //       ),
                //       Expanded(
                //         child: MyText(
                //           text: project.notableSolutions![i],
                //           maxLines: 32,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
          ],

          // Notable Problems & Solutions
          if (project.notableProblemsEncountered != null) ...[
            SizedBox(height: 16),
            MyLine(),

            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: MyText(
                text: "Notable Problems Encountered and The Solutions:",
                fontSize: kDefaultFontSize - 3,
                fontFamily: "Poppins",
              ),
            ),

            for (int i = 0; i < project.notableProblemsEncountered!.length; i++)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Row(
                  spacing: 12,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.amber.shade600.withAlpha(180),
                    ),
                    Expanded(
                      child: MyText(
                        text: project.notableProblemsEncountered![i],
                        maxLines: 32,
                      ),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    spacing: 12,
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.green.shade400,
                      ),
                      Expanded(
                        child: MyText(
                          text: project.notableSolutions![i],
                          maxLines: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],

          // Tech Stack Logos
          if (project.techStackImages != null) ...[
            // SizedBox(height: 16),
            MyLine(),

            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: MyText(
                text: "Tech stack:",
                fontSize: kDefaultFontSize - 3,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: project.techStackImages!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final techStackName = project.techStackImages![index]
                      .split("/")
                      .last
                      .split("_logo.png")
                      .first
                      .replaceAll("_", " ");

                  return Padding(
                    padding: const EdgeInsets.only(top: 8, right: 16),
                    child: Tooltip(
                      message: techStackName,
                      triggerMode: TooltipTriggerMode.tap,
                      child: Image.asset(project.techStackImages![index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
