import 'package:example/components/fabric_app_bar.dart';
import 'package:example/components/fabric_avatar_showcase.dart';
import 'package:example/components/fabric_banner.dart';
import 'package:example/components/fabric_bottom_navigation_bar.dart';
import 'package:example/components/fabric_bottom_sheet.dart';
import 'package:example/components/fabric_button.dart';
import 'package:example/components/fabric_cards.dart';
import 'package:example/components/fabric_carousel.dart';
import 'package:example/components/fabric_check_box.dart';
import 'package:example/components/fabric_chip.dart';
import 'package:example/components/fabric_datatable.dart';
import 'package:example/components/fabric_date_picker.dart';
import 'package:example/components/fabric_dialog.dart';
import 'package:example/components/fabric_drawer.dart';
import 'package:example/components/fabric_dropdown_menu.dart';
import 'package:example/components/fabric_empty_state_showcase.dart';
import 'package:example/components/fabric_expansion_panel.dart';
import 'package:example/components/fabric_float_action_button.dart';
import 'package:example/components/fabric_icon_button.dart';
import 'package:example/components/fabric_indicators.dart';
import 'package:example/components/fabric_list_tile.dart';
import 'package:example/components/fabric_menu_bar.dart';
import 'package:example/components/fabric_navigation_bar.dart';
import 'package:example/components/fabric_radio_button.dart';
import 'package:example/components/fabric_search_anchor.dart';
import 'package:example/components/fabric_segment_button.dart';
import 'package:example/components/fabric_skeleton_showcase.dart';
import 'package:example/components/fabric_slider.dart';
import 'package:example/components/fabric_snackbar.dart';
import 'package:example/components/fabric_status_badge.dart';
import 'package:example/components/fabric_stepper.dart';
import 'package:example/components/fabric_switch.dart';
import 'package:example/components/fabric_text.dart';
import 'package:example/components/fabric_text_field.dart';
import 'package:example/components/fabric_time_picker.dart';
import 'package:example/components/fabric_toggle_buttons.dart';
import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class _ComponentShowcaseItem {
  const _ComponentShowcaseItem({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.child,
  });

  final String title;
  final String subtitle;
  final String category;
  final Widget child;
}

class Home extends StatefulWidget {
  const Home({
    super.key,
    this.selectedSwatch = fabricGrey,
    this.themeMode = ThemeMode.system,
    this.onSwatchChanged,
    this.onThemeModeChanged,
  });

  final FabricSwatch selectedSwatch;
  final ThemeMode themeMode;
  final ValueChanged<FabricSwatch>? onSwatchChanged;
  final ValueChanged<ThemeMode>? onThemeModeChanged;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  String _searchQuery = '';

  static const List<_ComponentShowcaseItem> _inputsAndActions =
      <_ComponentShowcaseItem>[
    _ComponentShowcaseItem(
      title: 'Buttons',
      subtitle: 'Elevated, Filled, Filled Tonal, Outlined and Text buttons',
      category: 'Inputs & Actions',
      child: FabricButton(),
    ),
    _ComponentShowcaseItem(
      title: 'Segmented Button',
      subtitle: 'Single or multi-select segmented options',
      category: 'Inputs & Actions',
      child: FabricSegmentButton(),
    ),
    _ComponentShowcaseItem(
      title: 'Toggle Buttons',
      subtitle: 'Grouped icon toggle buttons',
      category: 'Inputs & Actions',
      child: FabricToggleButtons(),
    ),
    _ComponentShowcaseItem(
      title: 'Icon Buttons & Badges',
      subtitle: 'Standard, Outlined, Filled, Tonal icon buttons and Badges',
      category: 'Inputs & Actions',
      child: FabricIconButton(),
    ),
    _ComponentShowcaseItem(
      title: 'Floating Action Buttons',
      subtitle: 'Large, Standard, Small and Extended FABs',
      category: 'Inputs & Actions',
      child: FabricFloatActionButton(),
    ),
    _ComponentShowcaseItem(
      title: 'Text Fields',
      subtitle: 'Outlined text inputs with prefix/suffix icons, error & disabled states',
      category: 'Inputs & Actions',
      child: FabricTextField(),
    ),
    _ComponentShowcaseItem(
      title: 'Dropdown Menu & Tooltip',
      subtitle: 'Material 3 DropdownMenu and contextual Tooltip',
      category: 'Inputs & Actions',
      child: FabricDropdownMenu(),
    ),
    _ComponentShowcaseItem(
      title: 'Search Bar & Search Anchor',
      subtitle: 'Full-screen search view and search input bar',
      category: 'Inputs & Actions',
      child: FabricSearchAnchor(),
    ),
    _ComponentShowcaseItem(
      title: 'Chips',
      subtitle: 'FilterChip, InputChip and ActionChip variants',
      category: 'Inputs & Actions',
      child: FabricChip(),
    ),
    _ComponentShowcaseItem(
      title: 'Status Badges & Tags',
      subtitle: 'Inline semantic status badges with subtle, solid, and outline styles',
      category: 'Inputs & Actions',
      child: FabricStatusBadgeShowcase(),
    ),
    _ComponentShowcaseItem(
      title: 'Sliders & Range Sliders',
      subtitle: 'Continuous, discrete, disabled and range value sliders',
      category: 'Inputs & Actions',
      child: FabricSlider(),
    ),
    _ComponentShowcaseItem(
      title: 'Switches',
      subtitle: 'Toggle switches inside SwitchListTile',
      category: 'Inputs & Actions',
      child: FabricSwitch(),
    ),
    _ComponentShowcaseItem(
      title: 'Checkboxes',
      subtitle: 'Selected, unselected and disabled CheckboxListTile states',
      category: 'Inputs & Actions',
      child: FabricCheckbox(),
    ),
    _ComponentShowcaseItem(
      title: 'Radio Buttons',
      subtitle: 'Mutually exclusive RadioGroup options',
      category: 'Inputs & Actions',
      child: FabricRadioButton(),
    ),
  ];

  static const List<_ComponentShowcaseItem> _surfacesAndNavigation =
      <_ComponentShowcaseItem>[
    _ComponentShowcaseItem(
      title: 'Cards',
      subtitle: 'Flat Material 3 surface container cards',
      category: 'Surfaces & Nav',
      child: FabricCards(),
    ),
    _ComponentShowcaseItem(
      title: 'Carousel View',
      subtitle: 'Horizontal scrollable Material 3 CarouselView',
      category: 'Surfaces & Nav',
      child: FabricCarousel(),
    ),
    _ComponentShowcaseItem(
      title: 'List Tiles',
      subtitle: 'List rows with leading/trailing icons, title and subtitle',
      category: 'Surfaces & Nav',
      child: FabricListTile(),
    ),
    _ComponentShowcaseItem(
      title: 'Expansion Tiles',
      subtitle: 'Collapsible accordion panels',
      category: 'Surfaces & Nav',
      child: FabricExpansionPanel(),
    ),
    _ComponentShowcaseItem(
      title: 'Data Table',
      subtitle: 'Tabular data rows with selection checkboxes',
      category: 'Surfaces & Nav',
      child: FabricDatatable(),
    ),
    _ComponentShowcaseItem(
      title: 'Menu Bar & Cascading Menus',
      subtitle: 'Desktop/Web style MenuBar with SubmenuButton & MenuItemButton',
      category: 'Surfaces & Nav',
      child: FabricMenuBar(),
    ),
    _ComponentShowcaseItem(
      title: 'Bottom Navigation Bar',
      subtitle: 'Classic BottomNavigationBar component preview',
      category: 'Surfaces & Nav',
      child: FabricBottomNavigationBar(),
    ),
    _ComponentShowcaseItem(
      title: 'Stepper',
      subtitle: 'Horizontal and vertical multi-step progress flow',
      category: 'Surfaces & Nav',
      child: FabricStepperShowcase(),
    ),
    _ComponentShowcaseItem(
      title: 'Avatars & Avatar Groups',
      subtitle: 'Initials, presence status indicators, squircle shapes and stacked groups',
      category: 'Surfaces & Nav',
      child: FabricAvatarShowcase(),
    ),
  ];

  static const List<_ComponentShowcaseItem> _feedbackAndOverlays =
      <_ComponentShowcaseItem>[
    _ComponentShowcaseItem(
      title: 'Date & Date Range Picker',
      subtitle: 'Modal calendar and input pickers for single dates and ranges',
      category: 'Feedback & Overlays',
      child: FabricDatepicker(),
    ),
    _ComponentShowcaseItem(
      title: 'Time Picker',
      subtitle: 'Dial and input modal TimePicker',
      category: 'Feedback & Overlays',
      child: FabricTimePicker(),
    ),
    _ComponentShowcaseItem(
      title: 'Dialogs',
      subtitle: 'AlertDialog and Input Dialog modals',
      category: 'Feedback & Overlays',
      child: FabricDialog(),
    ),
    _ComponentShowcaseItem(
      title: 'Modal Bottom Sheet',
      subtitle: 'Slide-up modal sheet overlay',
      category: 'Feedback & Overlays',
      child: FabricBottomSheet(),
    ),
    _ComponentShowcaseItem(
      title: 'SnackBar',
      subtitle: 'Temporary floating feedback notification with action',
      category: 'Feedback & Overlays',
      child: FabricSnackbar(),
    ),
    _ComponentShowcaseItem(
      title: 'Material Banner',
      subtitle: 'Persistent banner notification with actions',
      category: 'Feedback & Overlays',
      child: FabricBannerShowcase(),
    ),
    _ComponentShowcaseItem(
      title: 'Progress Indicators',
      subtitle: 'LinearProgressIndicator and CircularProgressIndicator',
      category: 'Feedback & Overlays',
      child: FabricIndicators(),
    ),
    _ComponentShowcaseItem(
      title: 'Empty States',
      subtitle: 'Standardized zero data, 404, and no search results feedback screens',
      category: 'Feedback & Overlays',
      child: FabricEmptyStateShowcase(),
    ),
    _ComponentShowcaseItem(
      title: 'Skeleton Loaders',
      subtitle: 'Shimmer placeholders for cards, text lines, and avatars',
      category: 'Feedback & Overlays',
      child: FabricSkeletonShowcase(),
    ),
  ];

  static List<_ComponentShowcaseItem> get _allItems => <_ComponentShowcaseItem>[
        ..._inputsAndActions,
        ..._surfacesAndNavigation,
        ..._feedbackAndOverlays,
      ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _searchQuery = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: FabricAppBar(
          selectedSwatch: widget.selectedSwatch,
          themeMode: widget.themeMode,
          onSwatchChanged: widget.onSwatchChanged,
          onThemeModeChanged: widget.onThemeModeChanged,
          isSearching: _isSearching,
          searchController: _searchController,
          onSearchToggle: _toggleSearch,
        ),
        drawer: const CustomDrawer(),
        bottomNavigationBar: const FabricNavigationBar(),
        body: _isSearching && _searchQuery.isNotEmpty
            ? _buildSearchResults()
            : TabBarView(
                children: <Widget>[
                  _TokensTab(
                    selectedSwatch: widget.selectedSwatch,
                    themeMode: widget.themeMode,
                    onSwatchChanged: widget.onSwatchChanged,
                    onThemeModeChanged: widget.onThemeModeChanged,
                  ),
                  _ShowcaseCategoryList(items: _inputsAndActions),
                  _ShowcaseCategoryList(items: _surfacesAndNavigation),
                  _ShowcaseCategoryList(items: _feedbackAndOverlays),
                ],
              ),
      ),
    );
  }

  Widget _buildSearchResults() {
    final List<_ComponentShowcaseItem> filtered = _allItems.where((
      _ComponentShowcaseItem item,
    ) {
      return item.title.toLowerCase().contains(_searchQuery) ||
          item.subtitle.toLowerCase().contains(_searchQuery) ||
          item.category.toLowerCase().contains(_searchQuery);
    }).toList();

    if (filtered.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: <Widget>[
              Icon(
                Icons.search_off_outlined,
                size: 48,
                color: context.fabricSwatch.shade500,
              ),
              Text(
                'No components found for "$_searchQuery"',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Try searching for button, date, card, chip, input, or slider.',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return _ShowcaseCategoryList(
      items: filtered,
      showCategoryBadge: true,
    );
  }
}

class _ShowcaseCategoryList extends StatelessWidget {
  const _ShowcaseCategoryList({
    required this.items,
    this.showCategoryBadge = false,
  });

  final List<_ComponentShowcaseItem> items;
  final bool showCategoryBadge;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 20, bottom: 100),
      itemCount: items.length,
      separatorBuilder: (BuildContext context, int index) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Divider(),
      ),
      itemBuilder: (BuildContext context, int index) {
        final _ComponentShowcaseItem item = items[index];
        return _ShowcaseSection(
          title: item.title,
          subtitle: item.subtitle,
          categoryBadge: showCategoryBadge ? item.category : null,
          child: item.child,
        );
      },
    );
  }
}

class _ShowcaseSection extends StatelessWidget {
  const _ShowcaseSection({
    required this.title,
    required this.subtitle,
    required this.child,
    this.categoryBadge,
  });

  final String title;
  final String subtitle;
  final String? categoryBadge;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final FabricSwatch swatch = context.fabricSwatch;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  if (categoryBadge != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: isDark ? swatch.shade800 : swatch.shade50,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        categoryBadge!,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                ],
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark ? swatch.shade400 : swatch.shade500,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}

class _TokensTab extends StatelessWidget {
  const _TokensTab({
    required this.selectedSwatch,
    required this.themeMode,
    this.onSwatchChanged,
    this.onThemeModeChanged,
  });

  final FabricSwatch selectedSwatch;
  final ThemeMode themeMode;
  final ValueChanged<FabricSwatch>? onSwatchChanged;
  final ValueChanged<ThemeMode>? onThemeModeChanged;

  static String _colorToHex(Color color) {
    final int rgb = color.toARGB32() & 0xFFFFFF;
    return '#${rgb.toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    final FabricSwatch swatch = context.fabricSwatch;
    final List<({String label, Color color, bool lightText})> shades =
        <({String label, Color color, bool lightText})>[
      (label: '00', color: swatch.shade00, lightText: false),
      (label: '50', color: swatch.shade50, lightText: false),
      (label: '100', color: swatch.shade100, lightText: false),
      (label: '200', color: swatch.shade200, lightText: false),
      (label: '300', color: swatch.shade300, lightText: false),
      (label: '400', color: swatch.shade400, lightText: false),
      (label: '500', color: swatch.shade500, lightText: true),
      (label: '600', color: swatch.shade600, lightText: true),
      (label: '700', color: swatch.shade700, lightText: true),
      (label: '800', color: swatch.shade800, lightText: true),
      (label: '900', color: swatch.shade900, lightText: true),
      (label: '950', color: swatch.shade950, lightText: true),
    ];

    return ListView(
      padding: const EdgeInsets.only(top: 20, bottom: 100),
      children: <Widget>[
        _ShowcaseSection(
          title: 'Theme & Palette Controls',
          subtitle: 'Switch between Light, Dark or System mode and 8 FabricSwatch palettes',
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: <Widget>[
                    if (onThemeModeChanged != null)
                      SizedBox(
                        width: double.infinity,
                        child: SegmentedButton<ThemeMode>(
                          segments: const <ButtonSegment<ThemeMode>>[
                            ButtonSegment<ThemeMode>(
                              value: ThemeMode.system,
                              icon: Icon(Icons.brightness_auto_outlined),
                              label: Text('System'),
                            ),
                            ButtonSegment<ThemeMode>(
                              value: ThemeMode.light,
                              icon: Icon(Icons.light_mode_outlined),
                              label: Text('Light'),
                            ),
                            ButtonSegment<ThemeMode>(
                              value: ThemeMode.dark,
                              icon: Icon(Icons.dark_mode_outlined),
                              label: Text('Dark'),
                            ),
                          ],
                          selected: <ThemeMode>{themeMode},
                          onSelectionChanged: (Set<ThemeMode> selection) {
                            onThemeModeChanged?.call(selection.first);
                          },
                        ),
                      ),
                    if (onSwatchChanged != null)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: FabricAppBar.swatches.entries.map((
                          MapEntry<String, FabricSwatch> entry,
                        ) {
                          return ChoiceChip(
                            avatar: CircleAvatar(
                              backgroundColor: entry.value.shade500,
                              radius: 8,
                            ),
                            label: Text(entry.key),
                            selected: selectedSwatch == entry.value,
                            onSelected: (_) => onSwatchChanged?.call(entry.value),
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Divider(),
        ),
        _ShowcaseSection(
          title: 'Color Swatch Scale (00 – 950)',
          subtitle: 'Active FabricSwatch shades and hexadecimal values',
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: shades.map((
                  ({Color color, bool lightText, String label}) item,
                ) {
                  final Color fg = item.lightText
                      ? swatch.shade00
                      : swatch.shade800;
                  return Container(
                    height: 44,
                    color: item.color,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'shade${item.label}',
                          style: TextStyle(
                            color: fg,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          _colorToHex(item.color),
                          style: TextStyle(
                            color: fg.withValues(alpha: 0.85),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Divider(),
        ),
        _ShowcaseSection(
          title: 'Semantic Tokens (context.fabricTokens)',
          subtitle: 'Adaptive tokens for muted text, borders, elevated surfaces & status feedback',
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Builder(
              builder: (BuildContext context) {
                final FabricThemeExtension tokens = context.fabricTokens;
                final List<({String name, Color color})> semanticItems =
                    <({String name, Color color})>[
                  (name: 'mutedForeground', color: tokens.mutedForeground),
                  (name: 'borderColor', color: tokens.borderColor),
                  (name: 'surfaceElevated', color: tokens.surfaceElevated),
                  (name: 'successColor', color: tokens.successColor),
                  (name: 'warningColor', color: tokens.warningColor),
                  (name: 'infoColor', color: tokens.infoColor),
                ];

                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: semanticItems.map((
                    ({Color color, String name}) token,
                  ) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: tokens.surfaceElevated,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: tokens.borderColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: <Widget>[
                          Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: token.color,
                              shape: BoxShape.circle,
                              border: Border.all(color: tokens.borderColor),
                            ),
                          ),
                          Text(
                            token.name,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            _colorToHex(token.color),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: tokens.mutedForeground,
                                ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Divider(),
        ),
        const _ShowcaseSection(
          title: 'Typography Scale (Inter)',
          subtitle: 'Display, Headline, Title, Label and Body styles',
          child: FabricText(),
        ),
      ],
    );
  }
}
