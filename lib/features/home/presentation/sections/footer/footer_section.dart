import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/widgets/button.dart';
import 'package:my_portfolio/core/widgets/text.dart';

class MyFooterSection extends StatelessWidget {
  final double width;
  final double height;
  const MyFooterSection({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(
        top: (height * 0.08).clamp(8, 56),
        left: MySizeConstants.genericHorizontalPadding,
        right: MySizeConstants.genericHorizontalPadding,
      ),
      child: Column(
        children: [
          MyText(
            text: "Like what you see?\nWork with me!",
            fontSize: kDefaultFontSize + 24,
            fontFamily: "Poppins",
            textAlign: TextAlign.center,
            maxLines: 4,
          ),
          SizedBox(height: 16),

          SizedBox(
            width: width * 0.65,
            child: MyText(
              text:
                  "Currently looking for a Mobile Developer role. kjad adbkajbwd akjbdakjbwdwa djbakdjbawkjd akjbda dkjawdbabwdkjad akdjbbakw kjbdakjbwdwa djbakdjbawkjd akjbda dkjawdbabwdkjad akdjbbakw kjbdakjbwdwa djbakdjbawkjd akjbda dkj",
              // fontSize: kDefaultFontSize + 24,
              fontFamily: "Poppins",
              textAlign: TextAlign.center,
              maxLines: 6,
            ),
          ),
          SizedBox(height: 16),

          // MyButton(
          //   buttonText: "HIRE ME",
          //   buttonTextColor: myColorScheme.onSurface,
          //   buttonTextFontSize: kDefaultFontSize + 8,
          //   buttonTextFontWeight: FontWeight.w600,
          //   buttonTextFontFamily: "Quicksand",
          //   widthPercentage: 0.12,
          //   onTap: () {},
          // ),
          Expanded(
            child: Container(
              width: width * 0.4,
              // color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        MyText(text: "Contact Me On"),
                        account(
                          icon: Icon(Icons.email),
                          text: "dhetterjan23@gmail.com",
                        ),
                        account(
                          icon: Icon(Icons.phone_android_rounded),
                          text: "09876543210",
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        MyText(text: "Contact Me On"),
                        account(
                          icon: Icon(Icons.email),
                          text: "dhetterjan23@gmail.com",
                        ),
                        account(
                          icon: Icon(Icons.phone_android_rounded),
                          text: "09876543210",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row account({required Icon icon, required String text}) {
    return Row(
      children: [
        icon,
        TextButton(
          onPressed: () {},
          child: MyText(text: text),
        ),
      ],
    );
  }
}
