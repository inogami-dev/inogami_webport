import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_portfolio/features/home/presentation/sections/projects/widgets/project_detail_dialog.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/widgets/phone_mockup/mobile_phone_frame.dart';

class MyProjectCard extends StatelessWidget {
  final double screenHeight;
  final double widthPerProject;
  final String title;
  final String description;
  final String fullDescription;
  final List<String>? images;
  final List<String>? techStackImages;

  const MyProjectCard({
    super.key,
    required this.screenHeight,
    required this.widthPerProject,
    required this.title,
    required this.description,
    required this.fullDescription,
    this.images,
    this.techStackImages,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme myColorScheme = Theme.of(context).colorScheme;
    bool isScreenLowerThanMinHeight = screenHeight < 420;
    log(
      "Project Card heigh: $screenHeight, isScreenLowerThanMinHeight: $isScreenLowerThanMinHeight",
    );

    return InkWell(
      onTap: () {
        // myAlertDialogue(
        //   context: context,
        //   alertTitle: title,
        //   alertContent: fullDescription,
        //   isUsedAsInfoDialogOnly: true,
        //   contentWidget: contentWidget,
        //   barrierColor: myColorScheme.outlineVariant,
        //   onApprovalPressed: () {},
        // );
        showMyProjectDetailModal(
          context: context,
          title: title,
          fullDescription: fullDescription,
          isFullScreen: true,
          contentWidget: MyMobilePhoneFrame(
            images: images,
            heightPercentage: 1,
            leftPadding: 0,
          ),
          techStackImages: techStackImages,
        );
      },
      child: Container(
        width: widthPerProject,
        height: screenHeight,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          // color: Colors.grey,
          // color: myColorScheme.outlineVariant.withAlpha(156),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: widthPerProject,
              padding: EdgeInsets.only(
                top: (isScreenLowerThanMinHeight) ? 0 : 4,
              ),
              alignment: Alignment.center,
              child: MyMobilePhoneFrame(
                alignment: Alignment.center,
                heightPercentage: 0.4,
                images: images,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 16,
                bottom: (isScreenLowerThanMinHeight) ? 0 : 8,
              ),
              child: MyText(
                text: title,
                fontSize: kDefaultFontSize + 4,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
                maxLines: 3,
              ),
            ),

            if (!isScreenLowerThanMinHeight)
              Expanded(
                child: MyText(
                  text: description,
                  maxLines: 6,
                  textOverFlow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
