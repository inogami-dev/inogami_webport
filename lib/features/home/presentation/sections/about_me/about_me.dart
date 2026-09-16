import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/core/widgets/text_rich.dart';

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
    final myColorScheme = Theme.of(context).colorScheme;
    final double leftSideContents = width * 0.32;

    return Padding(
      padding: const EdgeInsets.only(left: 48, right: 48),
      child: Row(
        children: [
          // Left Side Contents
          Container(
            width: leftSideContents,
            height: height,
            padding: EdgeInsets.only(top: 16, right: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                // Center(
                //   child: Column(
                //     children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/me3.jpg"),
                ),
                // SizedBox(height: 16),

                MyText(
                  text: "Inogami",
                  fontFamily: "Poppins",
                  fontSize: kDefaultFontSize + 8,
                  fontWeight: FontWeight.w600,
                ),
                //     ],
                //   ),
                // ),

                MyText(
                  text:
                      "Senior IT student at UM Tagum College, specializing in mobile app development with Flutter.",
                  fontWeight: FontWeight.w500,
                  maxLines: 56,
                ),

                MyTextRich(
                  children: [
                    TextSpan(
                      text: "Driven by a simple philosophy: ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),

                    TextSpan(
                      text:
                          "intuitive functionality paired with clean, elegant UI and fluid interactions.",
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
          ),

          // Right Side Contents
          Expanded(
            child: Column(
              children: [Expanded(child: Container(color: Colors.amber))],
            ),
          ),
        ],
      ),
    );
  }
}
