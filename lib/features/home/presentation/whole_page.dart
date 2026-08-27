import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/navbar/navbar.dart';
import 'package:my_portfolio/features/home/presentation/sections/above_the_fold/above_the_fold.dart';

class MyHomePage extends StatefulWidget {
  final double screenHeight;
  const MyHomePage({super.key, required this.screenHeight});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;
    double headerHeight = 56;

    return Container(
      height: double.infinity,
      // color: Colors.amber,
      color: myColorScheme.surface,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            MyHeader(headerHeight: headerHeight, myColorScheme: myColorScheme),
            // Hero Section
            MyHeroSection(
              headerHeight: headerHeight,
              screenHeight: widget.screenHeight,
            ),
            // Additional Section
            SizedBox(
              height: widget.screenHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Placeholder(
                          child: MyText(text: "Placeholder 2"),
                        ),
                      ),
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
                      Expanded(
                        child: Placeholder(
                          child: MyText(text: "Placeholder 3"),
                        ),
                      ),
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
