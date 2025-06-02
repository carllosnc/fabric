import 'package:flutter/material.dart';

class FabricChip extends StatefulWidget {
  const FabricChip({super.key});

  @override
  State<FabricChip> createState() => _FabricChipState();
}

class _FabricChipState extends State<FabricChip> {
  bool isFilterSelected = false;
  bool isDarkMode = false;
  final Set<String> _selectedCategories = <String>{};
  final List<String> _categories = ['Music', 'Sports', 'Movies', 'Books'];
  int inputs = 3;
  int? selectedIndex;
  bool favorite = false;
  bool starred = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filter chips'),
          Wrap(
            spacing: 10,
            children: [
              ..._categories.map((String category) {
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
              }),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Input chips'),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 5.0,
                children: List<Widget>.generate(inputs, (int index) {
                  return InputChip(
                    label: Text('Person ${index + 1}'),
                    selected: selectedIndex == index,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selectedIndex == index) {
                          selectedIndex = null;
                        } else {
                          selectedIndex = index;
                        }
                      });
                    },
                    onDeleted: () {
                      setState(() {
                        inputs = inputs - 1;
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Action chips'),
              Wrap(
                spacing: 10,
                children: [
                  ActionChip(
                    avatar: Icon(starred ? Icons.star : Icons.star_border),
                    label: const Text('Save to favorites'),
                    onPressed: () {
                      setState(() {
                        starred = !starred;
                      });
                    },
                  ),
                  ActionChip(
                    avatar: Icon(favorite ? Icons.favorite : Icons.favorite_border),
                    label: const Text('Save to favorites'),
                    onPressed: () {
                      setState(() {
                        favorite = !favorite;
                      });
                    },
                  ),
                  ActionChip(
                    avatar: Icon(favorite ? Icons.favorite : Icons.favorite_border),
                    label: const Text('Save to favorites'),
                    onPressed: null,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
