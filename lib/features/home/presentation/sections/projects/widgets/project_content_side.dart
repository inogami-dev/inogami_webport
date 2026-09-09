import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class MyProjectContentSide extends StatelessWidget {
  final String fullDescription;
  final double height;
  final List<String>? logoImages;

  const MyProjectContentSide({
    super.key,
    required this.fullDescription,
    required this.height,
    this.logoImages,
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

            if (logoImages != null) ...[
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
                  itemCount: logoImages!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8, right: 16),
                      child: Image.asset(logoImages![index]),
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
