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
      padding: const EdgeInsets.only(left: 48),
      child: Row(
        children: [
          SizedBox(
            width: leftSideContents,
            height: height,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: width * 0.5,
                  height: height * 0.5,
                  // color: Colors.amber,
                  // margin: EdgeInsets.only(top: 32),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.asset("assets/images/me2.webp"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: leftSideContents,
                    height: height * 0.45,
                    padding: EdgeInsets.only(top: 32, left: 32, right: 32),
                    decoration: BoxDecoration(
                      color: myColorScheme.surfaceContainer,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
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
                              MyText(text: "-Steve Jobs"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(children: []),
        ],
      ),
    );
  }
}
