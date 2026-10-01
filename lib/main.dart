import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/core/theme/theme.dart';
import 'package:my_portfolio/features/home/domain/my_extensions/build_context_extension.dart';
import 'package:my_portfolio/features/home/presentation/whole_page.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
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
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return LayoutBuilder(
              builder: (context, constraints) {
                // if (constraints.maxWidth >= standardDesktopWidth) {
                //   log(
                //     "The screen is DESKTOP size.  width: ${constraints.maxWidth}  height: ${constraints.maxHeight}",
                //   );
                //   // return Placeholder();
                //   return MyHomePage(screenHeight: constraints.maxHeight);
                // } else if (constraints.maxWidth >= standardTabletWidth) {
                //   log(
                //     "The screen is TABLET size.  width: ${constraints.maxWidth}  height: ${constraints.maxHeight}",
                //   );
                //   // return Placeholder();
                //   return MyHomePage(
                //     screenHeight: constraints.maxHeight,
                //   ); // Not yet final (Placeholder for now)
                // } else {
                //   log(
                //     "The screen is PHONE SIZE, smaller than 360.  width: ${constraints.maxWidth}  height: ${constraints.maxHeight}",
                //   );
                //   return Placeholder(
                //     child: Container(
                //       width: constraints.maxWidth,
                //       color: Colors.green,
                //     ),
                //   );
                // }

                if (context.isDesktop) {
                  log(
                    "Is Desktop View ${context.screenWidth.toStringAsFixed(2)} -----------------",
                  );
                } else if (context.isTablet) {
                  log(
                    "Is Tablet View ${context.screenWidth.toStringAsFixed(2)} -----------------",
                  );
                } else if (context.isMobile) {
                  log(
                    "Is Mobile View ${context.screenWidth.toStringAsFixed(2)} -----------------",
                  );
                }

                return MyHomePage(screenHeight: constraints.maxHeight);
              },
            );
          },
        ),
      ),
    );
  }
}
