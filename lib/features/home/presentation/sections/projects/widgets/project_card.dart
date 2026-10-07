import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_portfolio/features/home/data/model/project_model.dart';
import 'package:my_portfolio/features/home/domain/my_extensions/build_context_extension.dart';
import 'package:my_portfolio/features/home/presentation/sections/projects/widgets/project_detail_dialog.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/widgets/phone_mockup/mobile_phone_frame.dart';

class MyProjectCard extends StatelessWidget {
  final double screenHeight;
  final double widthPerProject;
  // final String title;
  // final String description;
  // final String fullDescription;
  // final List<String>? images;
  // final List<String>? techStackImages;
  final MyProjectModel project;

  const MyProjectCard({
    super.key,
    required this.screenHeight,
    required this.widthPerProject,
    required this.project,
    // required this.title,
    // required this.description,
    // required this.fullDescription,
    // this.images,
    // this.techStackImages,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme myColorScheme = Theme.of(context).colorScheme;
    bool isScreenLowerThanMinHeight = screenHeight < 420;
    log(
      "Project Card heigh: $screenHeight, isScreenLowerThanMinHeight: $isScreenLowerThanMinHeight",
    );

    final bool isMobile = context.isMobile;
    final bool isTablet = context.isTablet;

    final List<Widget> cardContents = [
      Container(
        width: isMobile ? null : widthPerProject,
        padding: EdgeInsets.only(
          top: (isScreenLowerThanMinHeight || isMobile) ? 0 : 16,
        ),
        // color: Colors.pink,
        alignment: Alignment.center,
        child: MyMobilePhoneFrame(
          alignment: isMobile ? Alignment.centerLeft : Alignment.center,
          leftPadding: isTablet ? 0 : 16,
          heightPercentage: isMobile ? 1 : 0.4,
          images: project.images,
        ),
      ),

      // Applicable only to tablet and desktop view
      if (!isMobile) ...[
        Padding(
          padding: EdgeInsets.only(
            top: 16,
            bottom: (isScreenLowerThanMinHeight) ? 0 : 8,
          ),
          child: MyText(
            text: project.title,
            fontSize: kDefaultFontSize + 4,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            textOverFlow: (isScreenLowerThanMinHeight)
                ? TextOverflow.fade
                : TextOverflow.clip,
            maxLines: (isScreenLowerThanMinHeight) ? 1 : 3,
          ),
        ),

        // if (!isScreenLowerThanMinHeight)
        Expanded(
          child: MyText(
            text: project.shortDescription,
            maxLines: 6,
            textOverFlow: TextOverflow.ellipsis,
          ),
        ),
      ],

      if (isMobile) SizedBox(width: 12),
      if (isMobile)
        Expanded(
          child: Container(
            // color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 4),
                  child: MyText(
                    text: project.title,
                    fontSize: kDefaultFontSize + 4,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    maxLines: 3,
                  ),
                ),
                // SizedBox(height: 12),

                // if (!isScreenLowerThanMinHeight)
                Expanded(
                  child: MyText(
                    text: project.shortDescription,
                    maxLines: 6,
                    textOverFlow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
    ];

    return InkWell(
      onTap: () {
        showMyProjectDetailModal(
          context: context,
          project: project,
          isFullScreen: true,
          contentWidget: MyMobilePhoneFrame(
            images: project.images,
            heightPercentage: 1,
            leftPadding: 0,
          ),
        );
      },
      child: Container(
        width: widthPerProject,
        height: screenHeight,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: myColorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: myColorScheme.shadow.withAlpha(56),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: isMobile
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: cardContents,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: cardContents,
              ),
      ),
    );
  }
}
