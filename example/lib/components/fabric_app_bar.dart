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
    this.tabs = const <Tab>[
      Tab(text: 'Tokens'),
      Tab(text: 'Inputs & Actions'),
      Tab(text: 'Surfaces & Nav'),
      Tab(text: 'Feedback & Overlays'),
    ],
  });

  final FabricSwatch selectedSwatch;
  final ThemeMode themeMode;
  final ValueChanged<FabricSwatch>? onSwatchChanged;
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  final bool isSearching;
  final TextEditingController? searchController;
  final VoidCallback? onSearchToggle;
  final List<Tab> tabs;

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
  Size get preferredSize => Size.fromHeight(isSearching ? 64 : 110);

  IconData _themeModeIcon(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => Icons.light_mode_outlined,
      ThemeMode.dark => Icons.dark_mode_outlined,
      ThemeMode.system => Icons.brightness_auto_outlined,
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
      bottom: isSearching
          ? null
          : TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: tabs,
            ),
      actions: <Widget>[
        if (onSearchToggle != null)
          IconButton(
            tooltip: isSearching ? 'Close search' : 'Search components',
            onPressed: onSearchToggle,
            icon: Icon(isSearching ? Icons.close : Icons.search),
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
            icon: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                const Icon(Icons.palette_outlined),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: selectedSwatch.shade500,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 1.5,
                    ),
                  ),
                ),
              ],
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
