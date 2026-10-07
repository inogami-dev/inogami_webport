import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/features/home/domain/my_extensions/build_context_extension.dart';
import 'package:my_portfolio/features/home/presentation/sections/about_me/widgets/current_endeavors.dart';
import 'package:my_portfolio/features/home/presentation/sections/about_me/widgets/my_bio_contents.dart';
import 'package:my_portfolio/features/home/presentation/sections/about_me/widgets/my_education.dart';

class MyAboutMeSection extends StatelessWidget {
  final double width;
  final double height;
  const MyAboutMeSection({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.isMobile;

    // final myColorScheme = Theme.of(context).colorScheme;
    final double bioContentsWidth = isMobile ? width : width * 0.28;
    final double educationContentsWidth = isMobile ? width : width * 0.28;
    final double currentEndevorsContentsWidth = isMobile ? width : width * 0.28;

    // --- Dynamic Optical Center Top Padding ---
    final double estimatedContentHeight = width > 1200 ? 430.0 : 470.0;
    final double availableExtraSpace = height - estimatedContentHeight;
    final double dynamicTopPadding = (availableExtraSpace * 0.50).clamp(
      16.0,
      120.0,
    );

    final List<Widget> aboutMeContents = [
      // Left Side Contents
      MyBioContents(width: bioContentsWidth, height: height),
      if (!isMobile) Spacer(),
      // if (isMobile) SizedBox(width: 24),

      // Middle Contents
      MyEducation(width: educationContentsWidth, height: height),
      if (!isMobile) Spacer(),
      // if (isMobile) SizedBox(width: 24),

      CurrentEndeavors(width: currentEndevorsContentsWidth),
    ];

    return Container(
      width: width,
      height: isMobile ? null : height,
      padding: EdgeInsets.only(
        left: MySizeConstants.genericHorizontalPadding,
        right: MySizeConstants.genericHorizontalPadding,
        top: dynamicTopPadding,
      ), // add top padding here
      child: (isMobile)
          ? Column(spacing: 16, children: aboutMeContents)
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: aboutMeContents,
            ),
    );
  }
}
