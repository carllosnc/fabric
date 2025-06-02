import 'package:flutter/material.dart';

class FabricText extends StatelessWidget {
  const FabricText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          // Display
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.displayLarge),
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.displayMedium),
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.displaySmall),
            ],
          ),

          // Headline
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.headlineLarge),
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.headlineMedium),
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),

          // Label
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.titleLarge),
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.titleMedium),
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.titleSmall),
            ],
          ),

          // Label
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.labelLarge),
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.labelMedium),
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.labelSmall),
            ],
          ),

          // Body
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.bodyLarge),
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.bodyMedium),
              Text('Lorem ipsum dolor', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
