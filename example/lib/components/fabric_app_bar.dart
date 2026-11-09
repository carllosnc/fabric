import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class FabricAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FabricAppBar({
    super.key,
    this.selectedSwatch = fabricGrey,
    this.themeMode = ThemeMode.system,
    this.onSwatchChanged,
    this.onThemeModeChanged,
    this.isSearching = false,
    this.searchController,
    this.onSearchToggle,
  });

  final FabricSwatch selectedSwatch;
  final ThemeMode themeMode;
  final ValueChanged<FabricSwatch>? onSwatchChanged;
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  final bool isSearching;
  final TextEditingController? searchController;
  final VoidCallback? onSearchToggle;

  static const Map<String, FabricSwatch> swatches = <String, FabricSwatch>{
    'Grey': fabricGrey,
    'Blue': fabricBlue,
    'Red': fabricRed,
    'Green': fabricGreen,
    'Purple': fabricPurple,
    'Teal': fabricTeal,
    'Orange': fabricOrange,
    'Pink': fabricPink,
  };

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  IconData _themeModeIcon(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => Icons.light_mode_rounded,
      ThemeMode.dark => Icons.dark_mode_rounded,
      ThemeMode.system => Icons.contrast_rounded,
    };
  }

  ThemeMode _nextThemeMode(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.system => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
    };
  }

  String _themeModeLabel(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.system => 'System theme',
      ThemeMode.light => 'Light theme',
      ThemeMode.dark => 'Dark theme',
    };
  }

  @override
  Widget build(BuildContext context) {
    final FabricSwatch activeSwatch = context.fabricSwatch;

    return AppBar(
      title: isSearching && searchController != null
          ? TextField(
              controller: searchController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Search components (e.g. button, date, card)...',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: <Widget>[
                const Text('Fabric'),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? activeSwatch.shade800
                        : activeSwatch.shade50,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: activeSwatch.shade400.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    'M3',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ],
            ),
      actions: <Widget>[
        if (onSearchToggle != null)
          IconButton(
            tooltip: isSearching ? 'Close search' : 'Search components',
            onPressed: onSearchToggle,
            icon: Icon(isSearching ? Icons.close_rounded : Icons.search_rounded),
          ),
        if (onThemeModeChanged != null)
          IconButton(
            tooltip: _themeModeLabel(themeMode),
            onPressed: () => onThemeModeChanged!(_nextThemeMode(themeMode)),
            icon: Icon(_themeModeIcon(themeMode)),
          ),
        if (onSwatchChanged != null)
          PopupMenuButton<FabricSwatch>(
            tooltip: 'Select color palette',
            onSelected: onSwatchChanged,
            icon: SizedBox(
              width: 28,
              height: 28,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.palette_rounded,
                    size: 24,
                  ),
                  Positioned(
                    right: -2,
                    bottom: -2,
                    child: Container(
                      width: 11,
                      height: 11,
                      decoration: BoxDecoration(
                        color: selectedSwatch.shade500,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).appBarTheme.backgroundColor ??
                              Theme.of(context).scaffoldBackgroundColor,
                          width: 2,
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            itemBuilder: (BuildContext context) {
              return swatches.entries.map((MapEntry<String, FabricSwatch> entry) {
                final bool isSelected = entry.value == selectedSwatch;
                return PopupMenuItem<FabricSwatch>(
                  value: entry.value,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: entry.value.shade500,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: Text(entry.key)),
                      if (isSelected)
                        const Icon(Icons.check, size: 18),
                    ],
                  ),
                );
              }).toList();
            },
          ),
      ],
    );
  }
}
