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
  final Widget? contentWidget;

  const MyProjectCard({
    super.key,
    required this.screenHeight,
    required this.widthPerProject,
    required this.title,
    required this.description,
    required this.fullDescription,
    this.contentWidget,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme myColorScheme = Theme.of(context).colorScheme;
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
          contentWidget: contentWidget,
        );
      },
      child: Container(
        width: widthPerProject,
        height: screenHeight,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          // color: Colors.grey,
          color: myColorScheme.outlineVariant.withAlpha(156),
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
              // color: Colors.red,
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
      ),
    );
  }
}
