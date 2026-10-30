import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fabric/fabric.dart';

void main() {
  testWidgets('FabricBadge renders label, dot and custom styling properly', (tester) async {
    bool tapped = false;
    bool deleted = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: fabricConfig.getLightTheme(),
        home: Scaffold(
          body: Center(
            child: FabricBadge(
              label: 'Active',
              variant: FabricBadgeVariant.success,
              style: FabricBadgeStyle.subtle,
              size: FabricBadgeSize.md,
              showDot: true,
              onTap: () => tapped = true,
              onDeleted: () => deleted = true,
            ),
          ),
        ),
      ),
    );

    expect(find.text('Active'), findsOneWidget);
    expect(find.byIcon(Icons.close_rounded), findsOneWidget);

    // Tap badge
    await tester.tap(find.text('Active'));
    expect(tapped, isTrue);

    // Tap delete icon
    await tester.tap(find.byIcon(Icons.close_rounded));
    expect(deleted, isTrue);
  });

  testWidgets('FabricBadge renders all styles (subtle, solid, outline)', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: fabricConfig.getDarkTheme(),
        home: const Scaffold(
          body: Column(
            children: [
              FabricBadge(
                label: 'Subtle',
                variant: FabricBadgeVariant.info,
                style: FabricBadgeStyle.subtle,
              ),
              FabricBadge(
                label: 'Solid',
                variant: FabricBadgeVariant.warning,
                style: FabricBadgeStyle.solid,
              ),
              FabricBadge(
                label: 'Outline',
                variant: FabricBadgeVariant.error,
                style: FabricBadgeStyle.outline,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Subtle'), findsOneWidget);
    expect(find.text('Solid'), findsOneWidget);
    expect(find.text('Outline'), findsOneWidget);
  });
}
