import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/hover_grayscale_image.dart';

/// An elegant infinite marquee custom widget built specifically for local asset images.
class MyImageMarquee extends StatefulWidget {
  /// List of image asset paths (e.g., ["assets/images/logo/dart_logo.png",, ...]).
  final List<String> assetPaths;

  /// Height of the marquee banner.
  final double height;

  /// Width of each image card.
  final double itemWidth;

  /// Spacing between consecutive cards.
  final double spacing;

  /// Scroll speed in pixels per second (independent of screen size).
  final double pixelsPerSecond;

  /// Direction toggle: true scrolls to the right, false scrolls to the left.
  final bool reverse;

  /// Pauses scrolling when the cursor is hovering over the widget.
  final bool pauseOnHover;

  /// Enables a smooth gradient fade on the left and right edges.
  final bool enableEdgeFading;

  /// Width of the gradient fade mask in logical pixels.
  final double fadeWidth;

  /// Border radius for each image card.
  final BorderRadius borderRadius;

  /// Image BoxFit mode.
  final BoxFit fit;

  /// Optional tap callback for image interaction.
  final void Function(int index, String assetPath)? onTap;

  /// Optional custom builder if you want custom overlay/badges on cards.
  final Widget Function(BuildContext context, String assetPath, int index)?
  itemBuilder;

  const MyImageMarquee({
    super.key,
    required this.assetPaths,
    this.height = 180,
    this.itemWidth = 260,
    this.spacing = 16,
    this.pixelsPerSecond = 45,
    this.reverse = false,
    this.pauseOnHover = true,
    this.enableEdgeFading = true,
    this.fadeWidth = 80,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.fit = BoxFit.cover,
    this.onTap,
    this.itemBuilder,
  }) : assert(assetPaths.length > 0, 'assetPaths cannot be empty');

  @override
  State<MyImageMarquee> createState() => _MyImageMarqueeState();
}

class _MyImageMarqueeState extends State<MyImageMarquee>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  double get _singleSetWidth =>
      widget.assetPaths.length * (widget.itemWidth + widget.spacing);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _startAnimation();
  }

  void _startAnimation() {
    if (_singleSetWidth <= 0 || widget.pixelsPerSecond <= 0) return;

    final durationSeconds = _singleSetWidth / widget.pixelsPerSecond;
    _controller.duration = Duration(
      milliseconds: (durationSeconds * 1000).round(),
    );

    if (widget.reverse) {
      _controller.reverse(
        from: _controller.value == 0 ? 1.0 : _controller.value,
      );
    } else {
      _controller.forward(
        from: _controller.value == 1 ? 0.0 : _controller.value,
      );
    }

    _controller.repeat(reverse: false);
  }

  @override
  void didUpdateWidget(covariant MyImageMarquee oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pixelsPerSecond != widget.pixelsPerSecond ||
        oldWidget.assetPaths.length != widget.assetPaths.length ||
        oldWidget.itemWidth != widget.itemWidth ||
        oldWidget.spacing != widget.spacing ||
        oldWidget.reverse != widget.reverse) {
      _startAnimation();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleHover(bool isHovered) {
    if (!widget.pauseOnHover) return;
    if (isHovered) {
      _controller.stop();
    } else {
      _controller.repeat(reverse: false);
    }
  }

  Widget _defaultImageCard(BuildContext context, String assetPath, int index) {
    // Sample path format to filter: "assets/images/logo/dart_logo.png",
    final String logoName = assetPath
        .split("/")
        .last
        .split("logo.png")
        .first
        .replaceAll("_", " ")
        .trim();

    return Tooltip(
      message: logoName,
      child: Container(
        width: widget.itemWidth,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
          // border: Border.all(
          //   color: Theme.of(
          //     context,
          //   ).colorScheme.outlineVariant.withValues(alpha: 0.35),
          //   width: 1,
          // ),
        ),
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          // child: ColorFiltered(
          //   colorFilter: const ColorFilter.matrix(<double>[
          //     0.2126, 0.7152, 0.0722, 0, 0, // Red channel
          //     0.2126, 0.7152, 0.0722, 0, 0, // Green channel
          //     0.2126, 0.7152, 0.0722, 0, 0, // Blue channel
          //     0, 0, 0, 1, 0, // Alpha channel
          //   ]),
          //   child: Image.asset(
          //     assetPath,
          //     fit: widget.fit,
          //     errorBuilder: (context, error, stackTrace) {
          //       return Container(
          //         color: Colors.grey.shade900,
          //         alignment: Alignment.center,
          //         child: const Icon(
          //           Icons.broken_image_rounded,
          //           color: Colors.white38,
          //           size: 32,
          //         ),
          //       );
          //     },
          //   ),
          // ),
          child: MyHoverGrayscaleImage(assetPath: assetPath),
        ),
      ),
    );
  }

  Widget _buildSingleStrip(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.assetPaths.length, (index) {
        final path = widget.assetPaths[index];
        final child = widget.itemBuilder != null
            ? widget.itemBuilder!(context, path, index)
            : _defaultImageCard(context, path, index);

        return Padding(
          padding: EdgeInsets.only(right: widget.spacing),
          child: widget.onTap != null
              ? MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => widget.onTap!(index, path),
                    child: child,
                  ),
                )
              : child,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget marquee = LayoutBuilder(
      builder: (context, constraints) {
        final singleWidth = _singleSetWidth;
        if (singleWidth <= 0) return const SizedBox.shrink();

        // Calculate minimum repetitions to prevent gaps on ultra-wide viewports
        final neededCopies = (constraints.maxWidth / singleWidth).ceil() + 1;
        final repeatCount = neededCopies < 2 ? 2 : neededCopies;

        return ClipRect(
          child: OverflowBox(
            minWidth: 0,
            maxWidth: double.infinity,
            alignment: Alignment.centerLeft,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final progress = _controller.value;
                final offset = widget.reverse
                    ? -(1.0 - progress) * singleWidth
                    : -progress * singleWidth;

                return Transform.translate(
                  offset: Offset(offset, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      repeatCount,
                      (_) => _buildSingleStrip(context),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );

    // Apply the soft gradient fade on left and right borders
    if (widget.enableEdgeFading && widget.fadeWidth > 0) {
      marquee = ShaderMask(
        shaderCallback: (Rect bounds) {
          final fadeFraction = (widget.fadeWidth / bounds.width).clamp(
            0.0,
            0.45,
          );
          return LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [
              Colors.transparent,
              Colors.black,
              Colors.black,
              Colors.transparent,
            ],
            stops: [0.0, fadeFraction, 1.0 - fadeFraction, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: marquee,
      );
    }

    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: SizedBox(height: widget.height, child: marquee),
    );
  }
}
