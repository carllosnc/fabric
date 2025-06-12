import 'package:flutter/material.dart';

class FabricButton extends StatelessWidget {
  const FabricButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Wrap(
            spacing: 10,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Elevated')),
              ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined), label: Text('Elevated with Icon')),
              ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ],
          ),
          Wrap(
            spacing: 10,
            children: [
              FilledButton(onPressed: () {}, child: Text('Filled')),
              FilledButton.icon(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined), label: Text('Filled with Icon')),
              FilledButton(onPressed: null, child: Text('Filled Disabled')),
              FilledButton.tonal(onPressed: () {}, child: Text('Filled Tonal')),
            ],
          ),
          Wrap(
            spacing: 10,
            children: [
              OutlinedButton(onPressed: () {}, child: Text('Outlined')),
              OutlinedButton.icon(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined), label: Text('Outlined with Icon')),
              OutlinedButton(onPressed: null, child: Text('Outlined Disabled')),
            ],
          ),
          Wrap(
            spacing: 10,
            children: [
              TextButton(onPressed: () {}, child: Text('Text')),
              TextButton.icon(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined), label: Text('Text with Icon')),
              TextButton(onPressed: null, child: Text('Text Disabled')),
            ],
          ),
        ],
      ),
    );
  }
}
