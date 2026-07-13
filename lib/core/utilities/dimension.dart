import 'package:flutter/material.dart';

class MyDimensions {
  MyDimensions._();

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
