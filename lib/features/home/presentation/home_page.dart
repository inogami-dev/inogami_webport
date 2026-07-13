import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final double screenHeight;
  const MyHomePage({super.key, required this.screenHeight});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.amber,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            SizedBox(
              height: 56,
              child: Row(
                children: [
                  Expanded(child: Placeholder()),
                  Spacer(),
                  Expanded(child: Placeholder()),
                  Expanded(child: Placeholder()),
                ],
              ),
            ),
            // Hero Section
            SizedBox(
              height: widget.screenHeight - 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Expanded(child: Placeholder()),
                      Expanded(child: Placeholder()),
                    ],
                  ),
                  Expanded(child: Placeholder()),
                ],
              ),
            ),
            // Additional Section
            SizedBox(
              height: widget.screenHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Expanded(child: Placeholder()),
                      Expanded(child: Placeholder()),
                    ],
                  ),
                  Expanded(child: Placeholder()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
