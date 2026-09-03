import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class MyProjectsSection extends StatelessWidget {
  final Widget widget;
  final double screenHeight;
  final String sectionTitle;

  const MyProjectsSection({
    super.key,
    required this.widget,
    required this.screenHeight,
    required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Expanded(
                child: Placeholder(child: MyText(text: sectionTitle)),
              ),
              Expanded(child: Placeholder()),
            ],
          ),
          Expanded(child: Placeholder()),
        ],
      ),
    );
  }
}
