import 'package:flutter/material.dart';
import '../fabric_theme_extension.dart';

/// A standardized Empty State / Zero State presentation component for Fabric.
///
/// Flutter does not have a native Empty State widget or theme.
/// [FabricEmptyState] provides a clean, responsive layout for empty lists,
/// search results not found, 404 views, or network error screens with full token support.
class FabricEmptyState extends StatelessWidget {
  const FabricEmptyState({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.iconData,
    this.action,
    this.secondaryAction,
    this.compact = false,
    this.customContent,
    this.maxWidth = 420.0,
    this.padding,
  });

  /// Primary heading for the empty state.
  final String title;

  /// Explanatory secondary text describing why the state is empty or what to do next.
  final String? description;

  /// Custom icon or illustration widget. Takes precedence over [iconData].
  final Widget? icon;

  /// Convenient [IconData] displayed inside an elevated token container.
  final IconData? iconData;

  /// Primary action widget (e.g. [ElevatedButton] or [FilledButton]).
  final Widget? action;

  /// Optional secondary action widget (e.g. [OutlinedButton] or [TextButton]).
  final Widget? secondaryAction;

  /// Whether to render in a compact layout suitable for cards, modals, or tab views.
  final bool compact;

  /// Optional custom widget rendered between description and action buttons.
  final Widget? customContent;

  /// Max width constraint for typography and layout alignment.
  final double maxWidth;

  /// Optional outer padding.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = context.fabricTokens;
    final swatch = context.fabricSwatch;
    final isDark = theme.brightness == Brightness.dark;

    final iconBoxSize = compact ? 48.0 : 64.0;
    final iconGlyphSize = compact ? 24.0 : 32.0;

    Widget? leadingWidget = icon;
    if (leadingWidget == null && iconData != null) {
      leadingWidget = Container(
        width: iconBoxSize,
        height: iconBoxSize,
        decoration: BoxDecoration(
          color: isDark ? swatch.shade800 : swatch.shade100,
          borderRadius: BorderRadius.circular(compact ? 12 : 16),
          border: Border.all(
            color: tokens.borderColor,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Icon(
          iconData,
          size: iconGlyphSize,
          color: isDark ? swatch.shade300 : swatch.shade700,
        ),
      );
    }

    final effectivePadding = padding ??
        EdgeInsets.symmetric(
          horizontal: compact ? 16.0 : 24.0,
          vertical: compact ? 24.0 : 40.0,
        );

    final titleStyle = (compact
            ? theme.textTheme.titleSmall
            : theme.textTheme.titleMedium)
        ?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
      color: theme.colorScheme.onSurface,
    );

    final descStyle = (compact
            ? theme.textTheme.bodySmall
            : theme.textTheme.bodyMedium)
        ?.copyWith(
      color: tokens.mutedForeground,
      height: 1.45,
    );

    return Center(
      child: Padding(
        padding: effectivePadding,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leadingWidget != null) ...[
                leadingWidget,
                SizedBox(height: compact ? 12 : 20),
              ],
              Text(
                title,
                textAlign: TextAlign.center,
                style: titleStyle,
              ),
              if (description != null) ...[
                const SizedBox(height: 6),
                Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: descStyle,
                ),
              ],
              if (customContent != null) ...[
                SizedBox(height: compact ? 12 : 16),
                customContent!,
              ],
              if (action != null || secondaryAction != null) ...[
                SizedBox(height: compact ? 16 : 24),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ?secondaryAction,
                    ?action,
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
