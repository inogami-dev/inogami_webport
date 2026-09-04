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

    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenH = constraints.maxHeight;

        // Proportional sizing for the page indicator dots based on available screen height
        final double bottomOffset = (screenH * 0.024).clamp(6.0, 16.0);
        final double dotHeight = (screenH * 0.012).clamp(3.5, 6.0);
        final double activeDotWidth = dotHeight * 2.6;
        final double inactiveDotWidth = dotHeight;
        final double dotMargin = (dotHeight * 0.4).clamp(1.5, 3.5);
        final double padV = (dotHeight * 0.6).clamp(2.0, 4.5);
        final double padH = (dotHeight * 1.3).clamp(4.0, 9.0);
        final double pillRadius = (dotHeight * 1.8).clamp(6.0, 12.0);

        return ScrollConfiguration(
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
                // Swipeable Images
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

                // Proportional Page Indicator Dots
                if (widget.images.length > 1)
                  Positioned(
                    bottom: bottomOffset,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: padH,
                        vertical: padV,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(90),
                        borderRadius: BorderRadius.circular(pillRadius),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          widget.images.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: EdgeInsets.symmetric(horizontal: dotMargin),
                            width: _currentPage == index
                                ? activeDotWidth
                                : inactiveDotWidth,
                            height: dotHeight,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Colors.white
                                  : Colors.white.withAlpha(100),
                              borderRadius: BorderRadius.circular(
                                dotHeight / 2,
                              ),
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
      },
    );
  }
}
