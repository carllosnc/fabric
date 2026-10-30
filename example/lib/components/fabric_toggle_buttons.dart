import 'package:flutter/material.dart';

class FabricToggleButtons extends StatefulWidget {
  const FabricToggleButtons({super.key});

  @override
  State<FabricToggleButtons> createState() => _FabricToggleButtonsState();
}

class _FabricToggleButtonsState extends State<FabricToggleButtons> {
  final List<bool> _selected = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ToggleButtons(
        isSelected: _selected,
        onPressed: (int index) {
          setState(() {
            _selected[index] = !_selected[index];
          });
        },
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.format_bold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.format_italic),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.format_underlined),
          ),
        ],
      ),
    );
  }
}
