import 'package:flutter/material.dart';
import '../fabric_theme_extension.dart';

/// Predefined size tiers for [FabricAvatar].
enum FabricAvatarSize {
  xs(dimension: 24, fontSize: 10, iconSize: 12, statusDotSize: 7),
  sm(dimension: 32, fontSize: 12, iconSize: 16, statusDotSize: 9),
  md(dimension: 40, fontSize: 14, iconSize: 20, statusDotSize: 11),
  lg(dimension: 48, fontSize: 16, iconSize: 24, statusDotSize: 13),
  xl(dimension: 56, fontSize: 20, iconSize: 28, statusDotSize: 15),
  xxl(dimension: 72, fontSize: 26, iconSize: 36, statusDotSize: 18);

  const FabricAvatarSize({
    required this.dimension,
    required this.fontSize,
    required this.iconSize,
    required this.statusDotSize,
  });

  final double dimension;
  final double fontSize;
  final double iconSize;
  final double statusDotSize;
}

/// Shape options for [FabricAvatar].
enum FabricAvatarShape {
  circle,
  rounded,
}

/// Online/presence status for [FabricAvatar].
enum FabricAvatarStatus {
  none,
  online,
  away,
  busy,
  offline,
}

/// A modern, standardized Avatar component for the Fabric Design System.
///
/// Flutter's native `CircleAvatar` does not support shape variations, automatic
/// initials generation, presence status indicators with cutout rings, or
/// grouped stacking. [FabricAvatar] solves this with full theme token integration.
class FabricAvatar extends StatelessWidget {
  const FabricAvatar({
    super.key,
    this.image,
    this.name,
    this.icon,
    this.child,
    this.size = FabricAvatarSize.md,
    this.shape = FabricAvatarShape.circle,
    this.status = FabricAvatarStatus.none,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.onTap,
  });

  /// Image to display.
  final ImageProvider? image;

  /// Full name or label used to compute initials when [image] is null.
  final String? name;

  /// Fallback icon if neither [image] nor [name] are provided.
  final IconData? icon;

  /// Custom child widget.
  final Widget? child;

  /// Size tier.
  final FabricAvatarSize size;

  /// Circular or squircle/rounded rectangle.
  final FabricAvatarShape shape;

  /// Optional presence status indicator.
  final FabricAvatarStatus status;

  /// Custom background color. Defaults to token-aware elevated surface.
  final Color? backgroundColor;

  /// Custom foreground/text/icon color. Defaults to token-aware primary.
  final Color? foregroundColor;

  /// Perimeter border color.
  final Color? borderColor;

  /// Perimeter border width.
  final double borderWidth;

  /// Optional tap callback.
  final VoidCallback? onTap;

  static String computeInitials(String? name) {
    if (name == null || name.trim().isEmpty) return '';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    if (parts.length == 1) {
      return parts.first.substring(0, parts.first.length >= 2 ? 2 : 1).toUpperCase();
    }
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final tokens = context.fabricTokens;
    final swatch = context.fabricSwatch;

    final resolvedBg = backgroundColor ??
        (isDark ? swatch.shade800 : swatch.shade100);
    final resolvedFg = foregroundColor ??
        (isDark ? swatch.shade200 : swatch.shade800);
    final resolvedBorder = borderColor ?? tokens.borderColor;

    final radius = shape == FabricAvatarShape.circle
        ? BorderRadius.circular(size.dimension / 2)
        : BorderRadius.circular(size.dimension * 0.28);

    Widget innerContent;
    if (image != null) {
      innerContent = Image(
        image: image!,
        fit: BoxFit.cover,
        width: size.dimension,
        height: size.dimension,
        errorBuilder: (context, error, stackTrace) =>
            _buildFallback(resolvedFg),
      );
    } else if (child != null) {
      innerContent = child!;
    } else {
      innerContent = _buildFallback(resolvedFg);
    }

    final avatarBox = Container(
      width: size.dimension,
      height: size.dimension,
      decoration: BoxDecoration(
        color: resolvedBg,
        borderRadius: radius,
        border: borderWidth > 0
            ? Border.all(color: resolvedBorder, width: borderWidth)
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      child: innerContent,
    );

    Widget result;
    if (status != FabricAvatarStatus.none) {
      final statusColor = _resolveStatusColor(status, tokens, isDark);
      final dotDimension = size.statusDotSize;
      final ringColor = theme.scaffoldBackgroundColor;

      result = SizedBox(
        width: size.dimension,
        height: size.dimension,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            avatarBox,
            Positioned(
              right: shape == FabricAvatarShape.circle ? 0 : -2,
              bottom: shape == FabricAvatarShape.circle ? 0 : -2,
              child: Container(
                width: dotDimension,
                height: dotDimension,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: ringColor, width: 2),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      result = avatarBox;
    }

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: result,
        ),
      );
    }

    return result;
  }

  Widget _buildFallback(Color fg) {
    if (name != null && name!.trim().isNotEmpty) {
      final initials = computeInitials(name);
      return Text(
        initials,
        style: TextStyle(
          fontSize: size.fontSize,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
          color: fg,
        ),
      );
    }
    return Icon(
      icon ?? Icons.person_rounded,
      size: size.iconSize,
      color: fg,
    );
  }

  Color _resolveStatusColor(
    FabricAvatarStatus status,
    FabricThemeExtension tokens,
    bool isDark,
  ) {
    switch (status) {
      case FabricAvatarStatus.online:
        return tokens.successColor;
      case FabricAvatarStatus.away:
        return tokens.warningColor;
      case FabricAvatarStatus.busy:
        return isDark ? const Color(0xFFF87171) : const Color(0xFFDC2626);
      case FabricAvatarStatus.offline:
      case FabricAvatarStatus.none:
        return tokens.mutedForeground;
    }
  }
}

/// An overlapping horizontal stack of [FabricAvatar] widgets.
class FabricAvatarGroup extends StatelessWidget {
  const FabricAvatarGroup({
    super.key,
    required this.avatars,
    this.max = 4,
    this.overlap,
    this.onOverflowTap,
  }) : assert(max > 0, 'max must be greater than zero');

  /// List of avatars to display.
  final List<FabricAvatar> avatars;

  /// Maximum visible avatars before rendering the '+N' overflow indicator.
  final int max;

  /// Overlap distance between avatars. Defaults to ~25% of the first avatar's size.
  final double? overlap;

  /// Callback when the overflow avatar indicator is clicked.
  final VoidCallback? onOverflowTap;

  @override
  Widget build(BuildContext context) {
    if (avatars.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final swatch = context.fabricSwatch;
    final tokens = context.fabricTokens;

    final primaryAvatar = avatars.first;
    final size = primaryAvatar.size;
    final resolvedOverlap = overlap ?? (size.dimension * 0.28);
    final ringColor = theme.scaffoldBackgroundColor;

    final visibleCount = avatars.length > max ? max : avatars.length;
    final overflowCount = avatars.length - visibleCount;
    final totalItems = visibleCount + (overflowCount > 0 ? 1 : 0);
    final step = size.dimension - resolvedOverlap;
    final totalWidth = totalItems == 0 ? 0.0 : size.dimension + (totalItems - 1) * step;

    final stackChildren = <Widget>[];

    for (int i = 0; i < visibleCount; i++) {
      final avatar = avatars[i];
      stackChildren.add(
        Positioned(
          left: i * step,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: avatar.shape == FabricAvatarShape.circle
                  ? BoxShape.circle
                  : BoxShape.rectangle,
              borderRadius: avatar.shape == FabricAvatarShape.circle
                  ? null
                  : BorderRadius.circular(size.dimension * 0.28),
              border: Border.all(color: ringColor, width: 2),
            ),
            child: avatar,
          ),
        ),
      );
    }

    if (overflowCount > 0) {
      final overflowRadius = primaryAvatar.shape == FabricAvatarShape.circle
          ? BorderRadius.circular(size.dimension / 2)
          : BorderRadius.circular(size.dimension * 0.28);

      final overflowWidget = Positioned(
        left: visibleCount * step,
        top: 0,
        child: Container(
          width: size.dimension,
          height: size.dimension,
          decoration: BoxDecoration(
            shape: primaryAvatar.shape == FabricAvatarShape.circle
                ? BoxShape.circle
                : BoxShape.rectangle,
            borderRadius: primaryAvatar.shape == FabricAvatarShape.circle
                ? null
                : overflowRadius,
            border: Border.all(color: ringColor, width: 2),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? swatch.shade800 : swatch.shade200,
              shape: primaryAvatar.shape == FabricAvatarShape.circle
                  ? BoxShape.circle
                  : BoxShape.rectangle,
              borderRadius: primaryAvatar.shape == FabricAvatarShape.circle
                  ? null
                  : overflowRadius,
              border: Border.all(color: tokens.borderColor, width: 1),
            ),
            alignment: Alignment.center,
            child: Text(
              '+$overflowCount',
              style: TextStyle(
                fontSize: size.fontSize * 0.95,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.2,
                color: isDark ? swatch.shade200 : swatch.shade800,
              ),
            ),
          ),
        ),
      );

      if (onOverflowTap != null) {
        stackChildren.add(
          Positioned(
            left: visibleCount * step,
            top: 0,
            child: GestureDetector(
              onTap: onOverflowTap,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: overflowWidget.child,
              ),
            ),
          ),
        );
      } else {
        stackChildren.add(overflowWidget);
      }
    }

    return SizedBox(
      width: totalWidth,
      height: size.dimension,
      child: Stack(
        clipBehavior: Clip.none,
        children: stackChildren,
      ),
    );
  }
}
