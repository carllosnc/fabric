import 'package:flutter/material.dart';

class NeutralSearchAnchor extends StatefulWidget {
  const NeutralSearchAnchor({super.key});

  @override
  State<NeutralSearchAnchor> createState() => _NeutralSearchAnchorState();
}

class _NeutralSearchAnchorState extends State<NeutralSearchAnchor> {
  final SearchController controller = SearchController();
  final List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SearchAnchor(
        searchController: controller,
        builder: (context, controller) {
          return FilledButton.icon(
            icon: const Icon(Icons.search),
            label: const Text('Search'),
            onPressed: () {
              controller.openView();
            },
          );
        },
        suggestionsBuilder: (context, controller) {
          final keyword = controller.text.toLowerCase();
          return items.where((item) => item.toLowerCase().contains(keyword)).map(
                (item) => ListTile(
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
    );
  }
}
