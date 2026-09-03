import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/widgets/phone_mockup/mobile_phone_frame.dart';

class MyProjectsSection extends StatelessWidget {
  final double screenHeight;
  final String sectionTitle;

  const MyProjectsSection({
    super.key,
    required this.screenHeight,
    required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyDimensions.width(context),
      height: screenHeight,
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              height: screenHeight,
              color: Colors.grey,
              child: MyMobilePhoneFrame(),
            ),
          ),
          Expanded(
            child: Container(
              height: screenHeight,
              color: Colors.purple,
              child: MyMobilePhoneFrame(),
            ),
          ),
          Expanded(
            child: Container(
              height: screenHeight,
              color: Colors.blue,
              child: MyMobilePhoneFrame(),
            ),
          ),
        ],
      ),
    );
  }
}
