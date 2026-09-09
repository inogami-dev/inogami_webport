import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class MyProjectContentSide extends StatelessWidget {
  final String fullDescription;
  final double height;

  const MyProjectContentSide({
    super.key,
    required this.fullDescription,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: height * 0.75,
        // color: Colors.grey.shade600,
        padding: EdgeInsets.only(bottom: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(text: fullDescription, maxLines: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: FlutterLogo()),
                Expanded(child: FlutterLogo()),
                Expanded(child: FlutterLogo()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
