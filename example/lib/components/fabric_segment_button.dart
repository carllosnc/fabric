import 'package:flutter/material.dart';

class FabricSegmentButton extends StatefulWidget {
  const FabricSegmentButton({super.key});

  @override
  State<FabricSegmentButton> createState() => _FabricSegmentButtonState();
}

class _FabricSegmentButtonState extends State<FabricSegmentButton> {
  Set<String> selection = <String>{'Option A'};

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SegmentedButton<String>(
        segments: const <ButtonSegment<String>>[
          ButtonSegment<String>(
            value: 'Option A',
            label: Text('Option A'),
          ),
          ButtonSegment<String>(
            value: 'Option B',
            label: Text('Option B'),
          ),
          ButtonSegment<String>(
            value: 'Option C',
            label: Text('Option C'),
          ),
        ],
        selected: selection,
        onSelectionChanged: (Set<String> newSelection) {
          setState(() {
            selection = newSelection;
          });
        },
      ),
    );
  }
}
