import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class FabricSearchAnchor extends StatefulWidget {
  const FabricSearchAnchor({super.key});

  @override
  State<FabricSearchAnchor> createState() => _FabricSearchAnchorState();
}

class _FabricSearchAnchorState extends State<FabricSearchAnchor> {
  final SearchController controller = SearchController();

  final List<String> items = <String>[
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FabricThemeExtension tokens = context.fabricTokens;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SearchBarTheme(
        data: SearchBarTheme.of(context).copyWith(
          side: const WidgetStatePropertyAll<BorderSide>(BorderSide.none),
          shape: const WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
        ),
        child: SearchAnchor(
          searchController: controller,
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              hintText: 'Search fruits (e.g. Apple, Cherry)...',
              leading: Icon(Icons.search, size: 20, color: tokens.mutedForeground),
              side: WidgetStatePropertyAll<BorderSide>(
                BorderSide(color: tokens.borderColor),
              ),
              shape: WidgetStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 14),
              ),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
            );
          },
          suggestionsBuilder: (BuildContext context, SearchController controller) {
            final String keyword = controller.text.toLowerCase();
            return items
                .where((String item) => item.toLowerCase().contains(keyword))
                .map(
                  (String item) => ListTile(
                    leading: const Icon(Icons.history),
                    title: Text(item),
                    onTap: () {
                      controller.closeView(item);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Selected: $item')),
                      );
                    },
                  ),
                );
          },
        ),
      ),
    );
  }
}
