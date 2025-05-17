import 'package:flutter/material.dart';

class NeutralButton extends StatelessWidget {
  const NeutralButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 10,
        children: [
          FilledButton(onPressed: () {}, child: Text('Filled Button')),
          FilledButton.icon(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined), label: Text('Filled Button')),
          FilledButton(onPressed: null, child: Text('Diabled filled button')),
          OutlinedButton(onPressed: () {}, child: Text('Outlined Button')),
          OutlinedButton.icon(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined), label: Text('Outlined Button')),
          TextButton(onPressed: () {}, child: Text('Text Button')),
          TextButton.icon(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined), label: Text('Text Button')),
        ],
      ),
    );
  }
}
