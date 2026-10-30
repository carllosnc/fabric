import 'package:flutter/material.dart';

class FabricDropdownMenu extends StatefulWidget {
  const FabricDropdownMenu({super.key});

  @override
  State<FabricDropdownMenu> createState() => _FabricDropdownMenuState();
}

class _FabricDropdownMenuState extends State<FabricDropdownMenu> {
  String _selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          DropdownMenu<String>(
            initialSelection: _selectedOption,
            label: const Text('Select Option'),
            onSelected: (String? value) {
              if (value != null) {
                setState(() {
                  _selectedOption = value;
                });
              }
            },
            dropdownMenuEntries: const <DropdownMenuEntry<String>>[
              DropdownMenuEntry<String>(value: 'Option 1', label: 'Option 1'),
              DropdownMenuEntry<String>(value: 'Option 2', label: 'Option 2'),
              DropdownMenuEntry<String>(value: 'Option 3', label: 'Option 3'),
            ],
          ),
          Tooltip(
            message: 'Fabric Tooltip Preview',
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.info_outline),
              label: const Text('Hover / Long Press Tooltip'),
            ),
          ),
        ],
      ),
    );
  }
}
