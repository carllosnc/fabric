import 'package:flutter/material.dart';
import '../fabric_swatch.dart';
import '../fabric_theme_extension.dart';

/// Semantic variants for [FabricBadge].
enum FabricBadgeVariant {
  neutral,
  info,
  success,
  warning,
  error,
  primary,
}

/// Visual presentation styles for [FabricBadge].
enum FabricBadgeStyle {
  /// Soft tinted background with colored text and subtle border.
  subtle,

  /// Vibrant filled background with high-contrast text.
  solid,

  /// Transparent background with 1px colored perimeter border.
  outline,
}

/// Predefined sizes for [FabricBadge].
enum FabricBadgeSize {
  sm(height: 22, fontSize: 11, horizontalPadding: 8, iconSize: 12, dotSize: 6),
  md(height: 26, fontSize: 12, horizontalPadding: 10, iconSize: 14, dotSize: 7),
  lg(height: 32, fontSize: 13, horizontalPadding: 12, iconSize: 16, dotSize: 8);

  const FabricBadgeSize({
    required this.height,
    required this.fontSize,
    required this.horizontalPadding,
    required this.iconSize,
    required this.dotSize,
  });

  final double height;
  final double fontSize;
  final double horizontalPadding;
  final double iconSize;
  final double dotSize;
}

/// An inline semantic status badge/pill component for the Fabric Design System.
///
/// Flutter's native `Badge` is designed strictly as an overlay on top of icons.
/// [FabricBadge] provides a standalone, inline status pill with semantic variants,
/// optional status dot indicators, leading/trailing icons, and multiple styles.
class FabricBadge extends StatelessWidget {
  const FabricBadge({
    super.key,
    this.label,
    this.child,
    this.variant = FabricBadgeVariant.neutral,
    this.style = FabricBadgeStyle.subtle,
    this.size = FabricBadgeSize.md,
    this.showDot = false,
    this.leading,
    this.trailing,
    this.onTap,
    this.onDeleted,
    this.borderRadius,
  }) : assert(
          label != null || child != null,
          'Either label or child must be provided to FabricBadge',
        );

  /// Convenient text label for the badge.
  final String? label;

  /// Custom widget content (used if [label] is null).
  final Widget? child;

  /// Semantic role of the badge.
  final FabricBadgeVariant variant;

  /// Visual presentation style.
  final FabricBadgeStyle style;

  /// Size tier.
  final FabricBadgeSize size;

  /// Whether to display a status dot indicator before the content.
  final bool showDot;

  /// Optional leading icon or widget.
  final Widget? leading;

  /// Optional trailing widget (e.g. counter or icon).
  final Widget? trailing;

  /// Optional tap callback. When provided, the badge becomes interactive with ink ripples.
  final VoidCallback? onTap;

  /// Optional delete callback. Displays a dismiss 'x' icon at the end.
  final VoidCallback? onDeleted;

  /// Custom border radius. Defaults to a stadium/pill shape (999px).
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final tokens = context.fabricTokens;
    final swatch = context.fabricSwatch;

    final resolvedColors = _resolveColors(
      variant: variant,
      style: style,
      isDark: isDark,
      tokens: tokens,
      swatch: swatch,
      primaryColor: theme.colorScheme.primary,
    );

    final radius = borderRadius ?? BorderRadius.circular(999);

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showDot) ...[
          Container(
            width: size.dotSize,
            height: size.dotSize,
            decoration: BoxDecoration(
              color: resolvedColors.dotColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: size.dotSize),
        ],
        if (leading != null) ...[
          IconTheme.merge(
            data: IconThemeData(
              size: size.iconSize,
              color: resolvedColors.textColor,
            ),
            child: leading!,
          ),
          const SizedBox(width: 5),
        ],
        Flexible(
          child: child ??
              Text(
                label!,
                style: TextStyle(
                  fontSize: size.fontSize,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.1,
                  color: resolvedColors.textColor,
                  height: 1.1,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
        ),
        if (onDeleted != null) ...[
          const SizedBox(width: 4),
          InkWell(
            onTap: onDeleted,
            borderRadius: BorderRadius.circular(999),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Icon(
                Icons.close_rounded,
                size: size.iconSize,
                color: resolvedColors.textColor.withValues(alpha: 0.8),
              ),
            ),
          ),
        ] else if (trailing != null) ...[
          const SizedBox(width: 5),
          IconTheme.merge(
            data: IconThemeData(
              size: size.iconSize,
              color: resolvedColors.textColor,
            ),
            child: trailing!,
          ),
        ],
      ],
    );

    final decoration = BoxDecoration(
      color: resolvedColors.backgroundColor,
      borderRadius: radius,
      border: resolvedColors.borderColor != null
          ? Border.all(color: resolvedColors.borderColor!, width: 1)
          : null,
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: Ink(
          decoration: decoration,
          child: InkWell(
            onTap: onTap,
            borderRadius: radius,
            child: Container(
              height: size.height,
              padding: EdgeInsets.symmetric(
                horizontal: size.horizontalPadding,
              ),
              child: content,
            ),
          ),
        ),
      );
    }

    return Container(
      height: size.height,
      padding: EdgeInsets.symmetric(
        horizontal: size.horizontalPadding,
      ),
      decoration: decoration,
      child: content,
    );
  }

  _BadgeColors _resolveColors({
    required FabricBadgeVariant variant,
    required FabricBadgeStyle style,
    required bool isDark,
    required FabricThemeExtension tokens,
    required FabricSwatch swatch,
    required Color primaryColor,
  }) {
    Color baseColor;
    switch (variant) {
      case FabricBadgeVariant.neutral:
        baseColor = isDark ? swatch.shade300 : swatch.shade700;
        break;
      case FabricBadgeVariant.info:
        baseColor = tokens.infoColor;
        break;
      case FabricBadgeVariant.success:
        baseColor = tokens.successColor;
        break;
      case FabricBadgeVariant.warning:
        baseColor = tokens.warningColor;
        break;
      case FabricBadgeVariant.error:
        baseColor = isDark ? const Color(0xFFF87171) : const Color(0xFFDC2626);
        break;
      case FabricBadgeVariant.primary:
        baseColor = primaryColor;
        break;
    }

    switch (style) {
      case FabricBadgeStyle.subtle:
        if (variant == FabricBadgeVariant.neutral) {
          final bg = isDark ? swatch.shade800 : swatch.shade100;
          final border = isDark ? swatch.shade700 : swatch.shade200;
          final text = isDark ? swatch.shade200 : swatch.shade800;
          return _BadgeColors(
            backgroundColor: bg,
            borderColor: border,
            textColor: text,
            dotColor: isDark ? swatch.shade400 : swatch.shade600,
          );
        }
        final bg = isDark
            ? baseColor.withValues(alpha: 0.18)
            : baseColor.withValues(alpha: 0.10);
        final border = isDark
            ? baseColor.withValues(alpha: 0.35)
            : baseColor.withValues(alpha: 0.25);
        return _BadgeColors(
          backgroundColor: bg,
          borderColor: border,
          textColor: baseColor,
          dotColor: baseColor,
        );

      case FabricBadgeStyle.solid:
        final textColor = baseColor.computeLuminance() > 0.4
            ? const Color(0xFF1E293B)
            : Colors.white;
        return _BadgeColors(
          backgroundColor: baseColor,
          borderColor: null,
          textColor: textColor,
          dotColor: textColor.withValues(alpha: 0.8),
        );

      case FabricBadgeStyle.outline:
        return _BadgeColors(
          backgroundColor: Colors.transparent,
          borderColor: variant == FabricBadgeVariant.neutral
              ? (isDark ? swatch.shade700 : swatch.shade300)
              : baseColor.withValues(alpha: 0.6),
          textColor: baseColor,
          dotColor: baseColor,
        );
    }
  }
}

class _BadgeColors {
  const _BadgeColors({
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.dotColor,
  });

  final Color backgroundColor;
  final Color? borderColor;
  final Color textColor;
  final Color dotColor;
}
