import 'package:flutter/material.dart';
import '../fabric_theme_extension.dart';

/// Visual variant for [FabricBanner].
enum FabricBannerVariant {
  neutral,
  info,
  success,
  warning,
  error,
}

/// A bordered Material 3 banner component integrated with [FabricThemeExtension] tokens.
///
/// Renders a consistent `1px` perimeter border via [Card], optional leading icon
/// badge, title, description, and action buttons with uniform geometry.
class FabricBanner extends StatelessWidget {
  const FabricBanner({
    super.key,
    required this.content,
    this.title,
    this.leading,
    this.icon,
    this.actions = const <Widget>[],
    this.variant = FabricBannerVariant.neutral,
    this.padding = const EdgeInsets.all(16),
    this.margin,
  });

  /// Optional bold heading displayed above [content].
  final Widget? title;

  /// Primary message body of the banner.
  final Widget content;

  /// Optional custom leading widget. If omitted and [icon] is provided,
  /// renders a tinted icon badge.
  final Widget? leading;

  /// Optional icon displayed inside a tinted badge on the leading side.
  final IconData? icon;

  /// Action buttons displayed at the bottom-right of the banner.
  final List<Widget> actions;

  /// Semantic color variant of the banner's leading icon badge.
  final FabricBannerVariant variant;

  /// Inner padding of the banner card.
  final EdgeInsetsGeometry padding;

  /// Optional outer margin around the banner card.
  final EdgeInsetsGeometry? margin;

  Color _resolveAccentColor(
    BuildContext context,
    FabricThemeExtension tokens,
  ) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return switch (variant) {
      FabricBannerVariant.neutral => colorScheme.primary,
      FabricBannerVariant.info => tokens.infoColor,
      FabricBannerVariant.success => tokens.successColor,
      FabricBannerVariant.warning => tokens.warningColor,
      FabricBannerVariant.error => colorScheme.error,
    };
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final FabricThemeExtension tokens = context.fabricTokens;
    final Color accentColor = _resolveAccentColor(context, tokens);

    final Widget? resolvedLeading =
        leading ??
        (icon != null
            ? Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: accentColor,
                ),
              )
            : null);

    Widget card = Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (resolvedLeading != null) ...<Widget>[
                  resolvedLeading,
                  const SizedBox(width: 14),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: <Widget>[
                      if (title != null)
                        DefaultTextStyle.merge(
                          style: theme.textTheme.titleSmall,
                          child: title!,
                        ),
                      DefaultTextStyle.merge(
                        style: (title != null
                                ? theme.textTheme.bodySmall
                                : theme.textTheme.bodyMedium)
                            ?.copyWith(
                              color: title != null
                                  ? tokens.mutedForeground
                                  : theme.colorScheme.onSurface,
                            ),
                        child: content,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (actions.isNotEmpty) ...<Widget>[
              const SizedBox(height: 14),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.end,
                  children: actions,
                ),
              ),
            ],
          ],
        ),
      ),
    );

    if (margin != null) {
      card = Padding(
        padding: margin!,
        child: card,
      );
    }

    return card;
  }
}
