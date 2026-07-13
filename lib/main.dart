import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_portfolio/features/home/presentation/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  final int standardDesktopWidth = 1024;
  final int standardTabletWidth = 600;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= standardDesktopWidth) {
                log(
                  "The screen is DESKTOP size.  width: ${constraints.maxWidth}",
                );
                // return Placeholder();
                return MyHomePage(screenHeight: constraints.maxHeight);
              } else if (constraints.maxWidth >= standardTabletWidth) {
                log(
                  "The screen is TABLET size.  width: ${constraints.maxWidth}",
                );
                return Placeholder();
              } else {
                log(
                  "The screen is PHONE SIZE, smaller than 360.  width: ${constraints.maxWidth}",
                );
                return Placeholder(
                  child: Container(
                    width: constraints.maxWidth,
                    color: Colors.green,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
