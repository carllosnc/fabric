import 'package:flutter/material.dart';
import '../fabric_theme_extension.dart';

/// A modern shimmer skeleton loading placeholder for the Fabric Design System.
///
/// Flutter has no built-in skeleton loader or theme. [FabricSkeleton] provides
/// a GPU-efficient shimmer sweep animation that automatically adapts its
/// base and highlight colors to the active Fabric light or dark theme palette.
class FabricSkeleton extends StatefulWidget {
  const FabricSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    this.child,
    this.enabled = true,
  })  : isCircular = false,
        lines = 1,
        lineSpacing = 0;

  /// Circular skeleton variant (e.g. for avatars or circular action buttons).
  const FabricSkeleton.circular({
    super.key,
    required double size,
    this.baseColor,
    this.highlightColor,
    this.child,
    this.enabled = true,
  })  : width = size,
        height = size,
        borderRadius = null,
        isCircular = true,
        lines = 1,
        lineSpacing = 0;

  /// Text lines skeleton placeholder with realistic varied line widths.
  const FabricSkeleton.text({
    super.key,
    this.width,
    this.height = 14.0,
    this.lines = 1,
    this.lineSpacing = 8.0,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    this.enabled = true,
  })  : child = null,
        isCircular = false;

  /// Card / surface container skeleton placeholder.
  const FabricSkeleton.card({
    super.key,
    this.width,
    this.height = 140.0,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    this.child,
    this.enabled = true,
  })  : isCircular = false,
        lines = 1,
        lineSpacing = 0;

  /// Width of the skeleton placeholder.
  final double? width;

  /// Height of the skeleton placeholder or individual line.
  final double? height;

  /// Custom border radius. Defaults to 6px (or circle if [isCircular] is true).
  final BorderRadius? borderRadius;

  /// Whether the shape is a circle.
  final bool isCircular;

  /// Number of text lines (used in text mode).
  final int lines;

  /// Spacing between text lines.
  final double lineSpacing;

  /// Custom base shimmer color.
  final Color? baseColor;

  /// Custom highlight shimmer color.
  final Color? highlightColor;

  /// Child widget shown when [enabled] is false.
  final Widget? child;

  /// Whether skeleton shimmer is active. If false, renders [child].
  final bool enabled;

  @override
  State<FabricSkeleton> createState() => _FabricSkeletonState();
}

class _FabricSkeletonState extends State<FabricSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled && widget.child != null) {
      return widget.child!;
    }

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final swatch = context.fabricSwatch;

    final resolvedBase = widget.baseColor ??
        (isDark ? swatch.shade800 : swatch.shade100);
    final resolvedHighlight = widget.highlightColor ??
        (isDark ? swatch.shade700 : swatch.shade50);

    if (widget.lines > 1) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(widget.lines, (index) {
          final isLast = index == widget.lines - 1;
          final lineWidthFactor = isLast ? 0.65 : 1.0;

          return Padding(
            padding: EdgeInsets.only(
              bottom: isLast ? 0 : widget.lineSpacing,
            ),
            child: FractionallySizedBox(
              widthFactor: lineWidthFactor,
              child: _buildShimmerBox(
                width: widget.width,
                height: widget.height ?? 14.0,
                baseColor: resolvedBase,
                highlightColor: resolvedHighlight,
              ),
            ),
          );
        }),
      );
    }

    return _buildShimmerBox(
      width: widget.width,
      height: widget.height,
      baseColor: resolvedBase,
      highlightColor: resolvedHighlight,
    );
  }

  Widget _buildShimmerBox({
    required double? width,
    required double? height,
    required Color baseColor,
    required Color highlightColor,
  }) {
    final radius = widget.isCircular
        ? null
        : (widget.borderRadius ?? BorderRadius.circular(6));

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: widget.isCircular ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: radius,
            gradient: LinearGradient(
              begin: const Alignment(-1.0, -0.3),
              end: const Alignment(1.0, 0.3),
              stops: const [0.1, 0.5, 0.9],
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
              transform: _SlidingGradientTransform(slidePercent: _controller.value),
            ),
          ),
        );
      },
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({required this.slidePercent});

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * (slidePercent * 2 - 1), 0.0, 0.0);
  }
}
