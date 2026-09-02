import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyImageGallery extends StatefulWidget {
  final List<String> images;
  const MyImageGallery({super.key, required this.images});

  @override
  State<MyImageGallery> createState() => _MyImageGalleryState();
}

class _MyImageGalleryState extends State<MyImageGallery> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) return const SizedBox.shrink();

    return ScrollConfiguration(
      // Enables mouse and trackpad dragging on Web & Desktop
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.stylus,
        },
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.grab,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Swipeable / Draggable Images
            PageView.builder(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.images.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                return Image.asset(widget.images[index], fit: BoxFit.cover);
              },
            ),

            // Phone Screen Page Indicator Dots
            if (widget.images.length > 1)
              Positioned(
                bottom: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(90),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      widget.images.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: _currentPage == index ? 16 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.white
                              : Colors.white.withAlpha(100),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
