import 'package:flutter/material.dart';

class NeutralFloatActionButton extends StatelessWidget {
  const NeutralFloatActionButton({
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
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          FloatingActionButton.small(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          FloatingActionButton.extended(
            label: const Text('Add'),
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
