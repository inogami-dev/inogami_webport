import 'package:flutter/material.dart';

class MyMobilePhoneScreen extends StatefulWidget {
  // final double width;
  final double height;
  final double borderRadius;
  const MyMobilePhoneScreen({
    super.key,
    // required this.width,
    required this.height,
    required this.borderRadius,
  });

  @override
  State<MyMobilePhoneScreen> createState() => _MyMobilePhoneScreenState();
}

class _MyMobilePhoneScreenState extends State<MyMobilePhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.7,
      // margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      ),
      child: AspectRatio(
        aspectRatio: 9 / 20,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 4,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade900,
                radius: 4,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  radius: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
