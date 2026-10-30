import 'package:flutter/material.dart';

class FabricButton extends StatelessWidget {
  const FabricButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: <Widget>[
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined),
                label: const Text('Elevated with Icon'),
              ),
              const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ],
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              FilledButton(onPressed: () {}, child: const Text('Filled')),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined),
                label: const Text('Filled with Icon'),
              ),
              const FilledButton(onPressed: null, child: Text('Filled Disabled')),
              FilledButton.tonal(onPressed: () {}, child: const Text('Filled Tonal')),
            ],
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined),
                label: const Text('Outlined with Icon'),
              ),
              const OutlinedButton(onPressed: null, child: Text('Outlined Disabled')),
            ],
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              TextButton(onPressed: () {}, child: const Text('Text')),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined),
                label: const Text('Text with Icon'),
              ),
              const TextButton(onPressed: null, child: Text('Text Disabled')),
            ],
          ),
        ],
      ),
    );
  }
}
