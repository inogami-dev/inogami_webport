import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:my_portfolio/core/theme/theme.dart';
import 'package:my_portfolio/features/home/domain/my_extensions/build_context_extension.dart';
import 'package:my_portfolio/features/home/presentation/whole_page.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  // final int standardDesktopWidth = 1024;
  // final int standardTabletWidth = 600;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Builder(
        builder: (context) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (context.isDesktop) {
                log(
                  "Is Desktop View width: ${context.screenWidth.toStringAsFixed(2)} -----------------",
                );
              } else if (context.isTablet) {
                log(
                  "Is Tablet View width: ${context.screenWidth.toStringAsFixed(2)} -----------------",
                );
              } else if (context.isMobile) {
                log(
                  "Is Mobile View width: ${context.screenWidth.toStringAsFixed(2)} -----------------",
                );
              }

              return MyHomePage(screenHeight: constraints.maxHeight);
            },
          );
        },
      ),
    );
  }
}
