import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/core/widgets/text_rich.dart';
import 'package:my_portfolio/features/home/domain/my_extensions/build_context_extension.dart';

class MyBioContents extends StatelessWidget {
  final double width;
  final double height;

  const MyBioContents({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;
    final bool isMobile = context.isMobile;

    final List<Widget> profilePictureAndName = [
      CircleAvatar(
        backgroundColor: myColorScheme.primary.withAlpha(128),
        radius: 40,
        backgroundImage: AssetImage("assets/images/me3.jpg"),
      ),
      // SizedBox(height: 16),

      MyText(
        text: "Inogami",
        fontFamily: "Poppins",
        fontSize: kDefaultFontSize + (isMobile ? 12 : 8),
        fontWeight: FontWeight.w600,
      ),
    ];

    Widget contents = Container(
      width: width,
      // color: Colors.purple,
      // height: height,
      padding: EdgeInsets.only(right: 32, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          if (isMobile)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 16,
              children: profilePictureAndName,
            ),
          if (!isMobile) ...profilePictureAndName,

          MyText(
            text:
                "Senior IT student at UM Tagum College, specializing in mobile app development with Flutter.",
            fontWeight: FontWeight.w500,
            maxLines: 56,
          ),

          // MyTextRich(
          //   children: [
          //     TextSpan(
          //       text: "Driven by a simple philosophy: ",
          //       style: TextStyle(fontWeight: FontWeight.w600),
          //     ),
          //     TextSpan(
          //       text:
          //           "intuitive functionality paired with clean, elegant UI and fluid interactions.",
          //     ),
          //   ],
          // ),
          MyTextRich(
            children: [
              TextSpan(
                text: "Driven by philosophy: ",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              TextSpan(
                text: " Simple yet Elegant.",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),

          MyTextRich(
            children: [
              TextSpan(
                text: "Beyond the screen: ",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              TextSpan(
                text:
                    "A creative thinker and proactive builder who thrives in goal-driven environments, motivated to create high-impact software with teams that constantly push for greatness.",
              ),
            ],
          ),

          // Personnal Motto
          MyText(
            text: "Transforming chaos into elegant solutions",
            maxLines: 56,
            fontStyle: FontStyle.italic,
          ),
        ],
      ),
    );

    if (height < MySizeConstants.aboutMeSideContentMinHeight) {
      return SingleChildScrollView(child: contents);
    } else {
      return contents;
    }
  }
}
