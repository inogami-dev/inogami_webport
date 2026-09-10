import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class MyProjectContentSide extends StatelessWidget {
  final String fullDescription;
  final double height;
  final List<String>? techStackImages;

  const MyProjectContentSide({
    super.key,
    required this.fullDescription,
    required this.height,
    this.techStackImages,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: height * 0.75,
        // color: Colors.grey.shade600,
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: MyText(
                  text:
                      // fullDescription +
                      // fullDescription +
                      // fullDescription +
                      fullDescription,
                  maxLines: 32,
                ),
              ),
            ),

            if (techStackImages != null) ...[
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: MyText(
                  text: "Tech stack:",
                  fontSize: kDefaultFontSize - 4,
                ),
              ),
              SizedBox(
                // color: Colors.brown,
                height: height * 0.1,
                child: ListView.builder(
                  itemCount: techStackImages!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final techStackName = techStackImages![index]
                        .split("/")
                        .last
                        .split("_logo.png")
                        .first
                        .replaceAll("_", " ");

                    return Padding(
                      padding: const EdgeInsets.only(top: 8, right: 16),
                      child: Tooltip(
                        message: techStackName,
                        triggerMode: TooltipTriggerMode.tap,
                        child: Image.asset(techStackImages![index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
