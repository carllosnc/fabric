import 'package:flutter/material.dart';
import 'fabric_colors.dart';
import 'fabric_swatch.dart';

@immutable
class FabricThemeExtension extends ThemeExtension<FabricThemeExtension> {
  const FabricThemeExtension({
    required this.swatch,
    this.isDark = false,
    this._mutedForeground,
    this._borderColor,
    this._surfaceElevated,
    this._successColor,
    this._warningColor,
    this._infoColor,
  });

  final FabricSwatch swatch;
  final bool isDark;
  final Color? _mutedForeground;
  final Color? _borderColor;
  final Color? _surfaceElevated;
  final Color? _successColor;
  final Color? _warningColor;
  final Color? _infoColor;

  /// Secondary / muted text & icon color adapted to current brightness.
  Color get mutedForeground =>
      _mutedForeground ?? (isDark ? swatch.shade400 : swatch.shade500);

  /// Subtle 1px border token for surfaces, cards, and inputs.
  Color get borderColor =>
      _borderColor ?? (isDark ? swatch.shade700 : swatch.shade200);

  /// Elevated container surface color (Cards, SearchBar, SegmentedButton).
  Color get surfaceElevated =>
      _surfaceElevated ?? (isDark ? swatch.shade800 : swatch.shade50);

  /// Semantic status color for positive / success feedback.
  Color get successColor =>
      _successColor ??
      (isDark ? const Color(0xFF4ADE80) : const Color(0xFF16A34A));

  /// Semantic status color for caution / warning feedback.
  Color get warningColor =>
      _warningColor ??
      (isDark ? const Color(0xFFFBBF24) : const Color(0xFFD97706));

  /// Semantic status color for informational feedback.
  Color get infoColor =>
      _infoColor ??
      (isDark ? const Color(0xFF60A5FA) : const Color(0xFF2563EB));

  @override
  FabricThemeExtension copyWith({
    FabricSwatch? swatch,
    bool? isDark,
    Color? mutedForeground,
    Color? borderColor,
    Color? surfaceElevated,
    Color? successColor,
    Color? warningColor,
    Color? infoColor,
  }) {
    return FabricThemeExtension(
      swatch: swatch ?? this.swatch,
      isDark: isDark ?? this.isDark,
      mutedForeground: mutedForeground ?? _mutedForeground,
      borderColor: borderColor ?? _borderColor,
      surfaceElevated: surfaceElevated ?? _surfaceElevated,
      successColor: successColor ?? _successColor,
      warningColor: warningColor ?? _warningColor,
      infoColor: infoColor ?? _infoColor,
    );
  }

  @override
  FabricThemeExtension lerp(
    covariant ThemeExtension<FabricThemeExtension>? other,
    double t,
  ) {
    if (other is! FabricThemeExtension) {
      return this;
    }
    return FabricThemeExtension(
      swatch: FabricSwatch.lerp(swatch, other.swatch, t) ?? swatch,
      isDark: t < 0.5 ? isDark : other.isDark,
      mutedForeground: Color.lerp(mutedForeground, other.mutedForeground, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t),
      successColor: Color.lerp(successColor, other.successColor, t),
      warningColor: Color.lerp(warningColor, other.warningColor, t),
      infoColor: Color.lerp(infoColor, other.infoColor, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is FabricThemeExtension &&
        other.swatch == swatch &&
        other.isDark == isDark &&
        other.mutedForeground == mutedForeground &&
        other.borderColor == borderColor &&
        other.surfaceElevated == surfaceElevated &&
        other.successColor == successColor &&
        other.warningColor == warningColor &&
        other.infoColor == infoColor;
  }

  @override
  int get hashCode => Object.hash(
        swatch,
        isDark,
        mutedForeground,
        borderColor,
        surfaceElevated,
        successColor,
        warningColor,
        infoColor,
      );
}

extension FabricBuildContextExtension on BuildContext {
  FabricSwatch get fabricSwatch =>
      Theme.of(this).extension<FabricThemeExtension>()?.swatch ?? fabricGrey;

  FabricThemeExtension get fabricTokens =>
      Theme.of(this).extension<FabricThemeExtension>() ??
      FabricThemeExtension(
        swatch: fabricGrey,
        isDark: Theme.of(this).brightness == Brightness.dark,
      );
}
