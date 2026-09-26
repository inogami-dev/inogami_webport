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

    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.only(
          // top: (height * 0.04).clamp(8, 56),
          left: MySizeConstants.genericHorizontalPadding,
          right: MySizeConstants.genericHorizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            const MyText(
              text: "Like what you see?\nHire me!",
              fontSize: kDefaultFontSize + 24,
              fontFamily: "Poppins",
              textAlign: TextAlign.center,
              maxLines: 4,
            ),
            const SizedBox(height: 12),

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
            const SizedBox(height: 48),

            // MyButton(
            //   buttonText: "HIRE ME",
            //   buttonTextColor: myColorScheme.onSurface,
            //   buttonTextFontSize: kDefaultFontSize + 8,
            //   buttonTextFontWeight: FontWeight.w600,
            //   buttonTextFontFamily: "Quicksand",
            //   widthPercentage: 0.12,
            //   onTap: () {},
            // ),

            //
            if (height > MySizeConstants.deskTopScreenMinHeight) ...[
              SizedBox(
                width: width * 0.65,
                // color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 24,
                  children: [
                    Column(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        MyText(text: "Follow Me On"),
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
                  ],
                ),
              ),
              const SizedBox(height: 48),
            ],

            //
            MyButton(
              buttonText: "Download Resume",
              buttonTextColor: myColorScheme.onSurface,
              buttonTextFontSize: kDefaultFontSize + ((width > 1160) ? 2 : 0),
              buttonTextFontWeight: FontWeight.w600,
              buttonTextFontFamily: "Quicksand",
              widthPercentage: 0.16,
              borderWidth: 1,
              onTap: () {},
            ),
            // const SizedBox(height: 48),

            Spacer(),

            //
            MyText(
              text: "Designed and built from scratch using Flutter Web • 2026",
            ),
            const SizedBox(height: 16),
          ],
        ),
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
