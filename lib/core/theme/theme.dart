import 'package:flutter/material.dart';

class MyTheme {
  MyTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ).copyWith(
            // onPrimary: const Color.fromARGB(255, 231, 231, 231),
            // primaryFixed: Colors.blue.shade300,
          ),
      // textTheme: _myTextTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.dark,
          ).copyWith(
            // onPrimary: const Color.fromARGB(255, 231, 231, 231),
            // primaryFixed: Colors.blue.shade300,
          ),
      // textTheme: _myTextTheme,
    );
  }

  // static TextTheme get _myTextTheme {
  //   return TextTheme(

  //   );
  // }
}
