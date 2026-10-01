import 'package:flutter/material.dart';

extension MyBuildContextExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isDesktop => screenWidth >= 1100;
  bool get isTablet => screenWidth >= 650 && screenWidth < 1100;
  bool get isMobile => screenWidth < 650;
}
