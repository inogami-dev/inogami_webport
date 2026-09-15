import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';

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
            padding: EdgeInsets.only(top: 24, right: 16),
            child: Column(
              spacing: 16,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/me3.jpg"),
                ),

                MyText(
                  text: "Inogami",
                  fontFamily: "Poppins",
                  fontSize: kDefaultFontSize + 8,
                  fontWeight: FontWeight.w600,
                ),
                MyText(
                  text:
                      "whdakj akjdbajd wjkabdwjk akjdawj wjkdbawkdjb awjdbakwjbd whdakj akjdbajd wjkabdwjk akjdawj wjkdbawkdjb awjdbakwjbd",
                  maxLines: 56,
                ),

                // Quote
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MyText(
                        text:
                            "\"The only way to do great work is to love what you do\"",
                        maxLines: 56,
                      ),
                      MyText(text: "- Steve Jobs"),
                    ],
                  ),
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
