import 'package:flutter/material.dart';

class FabricIconButton extends StatelessWidget {
  const FabricIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          Badge(
            label: const Text('badge'),
            child: IconButton.filled(
              icon: const Icon(
                Icons.star_border_outlined,
                size: 24.0,
              ),
              onPressed: () {},
            ),
          ),
          Badge(
            label: const Text('99+'),
            child: IconButton.filled(
              icon: const Icon(
                Icons.star_border_outlined,
                size: 24.0,
              ),
              onPressed: () {},
            ),
          ),
          Badge(
            label: const Text('2'),
            child: IconButton.filled(
              icon: const Icon(
                Icons.star_border_outlined,
                size: 24.0,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
