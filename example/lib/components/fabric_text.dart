import 'package:flutter/material.dart';

class FabricText extends StatelessWidget {
  const FabricText({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: <Widget>[
              Text('Display Large (40px)', style: textTheme.displayLarge),
              Text('Display Medium (38px)', style: textTheme.displayMedium),
              Text('Display Small (36px)', style: textTheme.displaySmall),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: <Widget>[
              Text('Headline Large (32px)', style: textTheme.headlineLarge),
              Text('Headline Medium (28px)', style: textTheme.headlineMedium),
              Text('Headline Small (24px)', style: textTheme.headlineSmall),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: <Widget>[
              Text('Title Large (22px)', style: textTheme.titleLarge),
              Text('Title Medium (16px)', style: textTheme.titleMedium),
              Text('Title Small (14px)', style: textTheme.titleSmall),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: <Widget>[
              Text('Label Large (14px)', style: textTheme.labelLarge),
              Text('Label Medium (12px)', style: textTheme.labelMedium),
              Text('Label Small (11px)', style: textTheme.labelSmall),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: <Widget>[
              Text(
                'Body Large (16px) — The quick brown fox jumps over the lazy dog.',
                style: textTheme.bodyLarge,
              ),
              Text(
                'Body Medium (14px) — The quick brown fox jumps over the lazy dog.',
                style: textTheme.bodyMedium,
              ),
              Text(
                'Body Small (12px) — The quick brown fox jumps over the lazy dog.',
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
