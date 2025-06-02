import 'package:flutter/material.dart';

class FabricFloatActionButton extends StatelessWidget {
  const FabricFloatActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        spacing: 10,
        children: [
          FloatingActionButton.large(
            heroTag: 'fbt1',
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'fbt2',
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          FloatingActionButton.small(
            heroTag: 'fbt3',
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          FloatingActionButton.extended(
            heroTag: 'fbt4',
            label: const Text('Add'),
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
