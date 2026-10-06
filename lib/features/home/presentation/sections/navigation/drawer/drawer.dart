import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/animated_text.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/domain/my_extensions/build_context_extension.dart';
import 'package:my_portfolio/features/home/presentation/sections/navigation/navbar/widgets/buttons.dart';

class MyDrawer extends StatelessWidget {
  final List<GlobalKey> sectionKeys;

  const MyDrawer({super.key, required this.sectionKeys});

  void _scrollTo(int index, BuildContext context) {
    Navigator.of(context).pop(); // Close drawer first
    final key = sectionKeys[index];
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;

    final navItems = [
      {'title': 'Inogami', 'index': 0},
      {'title': 'Projects', 'index': 1},
      {'title': 'About Me', 'index': 2},
      {'title': 'Certificates', 'index': 3},
      {'title': 'Contact Me', 'index': 4},
    ];

    bool isDenseToFitSmallerHeight = context.screenHeight <= 420;

    return Drawer(
      backgroundColor: myColorScheme.surfaceContainerLow,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // // Close button or Title
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const MyText(
                //       text: "Menu",
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //     ),
                //     IconButton(
                //       onPressed: () => Navigator.of(context).pop(),
                //       icon: const Icon(Icons.close_rounded),
                //     ),
                //   ],
                // ),
                // const Divider(height: 32),

                // // Navigation Links
                // for (final item in navItems)
                //   ListTile(
                //     title: MyText(
                //       text: item['title'] as String,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w600,
                //     ),
                //     onTap: () => _scrollTo(item['index'] as int, context),
                //   ),
                ListTile(
                  dense: isDenseToFitSmallerHeight,
                  title: MyAnimatedText(
                    text: navItems[0]["title"] as String,
                    fontSize: kDefaultFontSize + 8,
                  ),
                  onTap: () => _scrollTo(navItems[0]['index'] as int, context),
                ),
                ListTile(
                  dense: isDenseToFitSmallerHeight,
                  title: MyText(text: navItems[1]["title"] as String),
                  onTap: () => _scrollTo(navItems[1]['index'] as int, context),
                ),
                ListTile(
                  dense: isDenseToFitSmallerHeight,
                  title: MyText(text: navItems[2]["title"] as String),
                  onTap: () => _scrollTo(navItems[2]['index'] as int, context),
                ),
                ListTile(
                  dense: isDenseToFitSmallerHeight,
                  title: MyText(text: navItems[3]["title"] as String),
                  onTap: () => _scrollTo(navItems[3]['index'] as int, context),
                ),
                // ListTile(
                //   title: MyAnimatedText(text: navItems[4]["title"] as String),
                //   onTap: () => _scrollTo(navItems[4]['index'] as int, context),
                // ),
                MyNavbarButton(
                  height: (context.screenHeight * 0.06).clamp(32, 48),
                  text: navItems[4]["title"] as String,
                  isUsedAsCTAButton: true,
                  alignment: Alignment.centerLeft,
                  fontSize: kDefaultFontSize + 2,
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => _scrollTo(navItems[4]['index'] as int, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
