import 'package:flutter/material.dart';

class MyHoverGrayscaleImage extends StatefulWidget {
  final String assetPath;
  const MyHoverGrayscaleImage({super.key, required this.assetPath});

  @override
  State<MyHoverGrayscaleImage> createState() => _MyHoverGrayscaleImageState();
}

class _MyHoverGrayscaleImageState extends State<MyHoverGrayscaleImage> {
  bool _isHovered = false;

  static const List<double> _grayscaleMatrix = <double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ];

  static const List<double> _identityMatrix = <double>[
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: _isHovered ? 1.0 : 0.7,
        child: ColorFiltered(
          colorFilter: ColorFilter.matrix(
            _isHovered ? _identityMatrix : _grayscaleMatrix,
          ),
          child: Image.asset(widget.assetPath),
        ),
      ),
    );
  }
}
