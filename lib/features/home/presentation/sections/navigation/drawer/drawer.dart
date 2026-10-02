import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';

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
      {'title': 'Home', 'index': 0},
      {'title': 'Projects', 'index': 1},
      {'title': 'About Me', 'index': 2},
      {'title': 'Certificates', 'index': 3},
      {'title': 'Contact', 'index': 4},
    ];

    return Drawer(
      backgroundColor: myColorScheme.surfaceContainerLow,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
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

              // Navigation Links
              for (final item in navItems)
                ListTile(
                  title: MyText(
                    text: item['title'] as String,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () => _scrollTo(item['index'] as int, context),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
