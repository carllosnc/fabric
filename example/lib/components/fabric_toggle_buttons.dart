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
      child: Align(
        alignment: Alignment.centerLeft,
        child: ToggleButtons(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          isSelected: _selected,
          onPressed: (int index) {
            setState(() {
              _selected[index] = !_selected[index];
            });
          },
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.format_bold, size: 18),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.format_italic, size: 18),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.format_underlined, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
