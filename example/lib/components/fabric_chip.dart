import 'package:flutter/material.dart';

class FabricChip extends StatefulWidget {
  const FabricChip({super.key});

  @override
  State<FabricChip> createState() => _FabricChipState();
}

class _FabricChipState extends State<FabricChip> {
  final Set<String> _selectedCategories = <String>{'Music'};
  final List<String> _categories = <String>['Music', 'Sports', 'Movies', 'Books'];
  int inputs = 3;
  int? selectedIndex = 0;
  bool favorite = false;
  bool starred = true;

  @override
  Widget build(BuildContext context) {
    final TextStyle? groupLabelStyle = Theme.of(context).textTheme.labelMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: <Widget>[
              Text('Filter chips', style: groupLabelStyle),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _categories.map((String category) {
                  return FilterChip(
                    selected: _selectedCategories.contains(category),
                    label: Text(category),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedCategories.add(category);
                        } else {
                          _selectedCategories.remove(category);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: <Widget>[
              Text('Input chips', style: groupLabelStyle),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List<Widget>.generate(inputs, (int index) {
                  return InputChip(
                    label: Text('Person ${index + 1}'),
                    selected: selectedIndex == index,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedIndex = selectedIndex == index ? null : index;
                      });
                    },
                    onDeleted: () {
                      setState(() {
                        if (inputs > 1) {
                          inputs = inputs - 1;
                        }
                      });
                    },
                  );
                }),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: <Widget>[
              Text('Action chips', style: groupLabelStyle),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  ActionChip(
                    avatar: Icon(starred ? Icons.star : Icons.star_border),
                    label: const Text('Starred'),
                    onPressed: () {
                      setState(() {
                        starred = !starred;
                      });
                    },
                  ),
                  ActionChip(
                    avatar: Icon(favorite ? Icons.favorite : Icons.favorite_border),
                    label: const Text('Favorite'),
                    onPressed: () {
                      setState(() {
                        favorite = !favorite;
                      });
                    },
                  ),
                  const ActionChip(
                    avatar: Icon(Icons.lock_outline),
                    label: Text('Disabled'),
                    onPressed: null,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
