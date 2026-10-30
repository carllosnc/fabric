import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fabric/fabric.dart';

void main() {
  testWidgets('FabricSkeleton renders single box, circular and text modes properly', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: fabricConfig.getLightTheme(),
        home: const Scaffold(
          body: Column(
            children: [
              FabricSkeleton(width: 100, height: 20),
              FabricSkeleton.circular(size: 40),
              FabricSkeleton.text(lines: 3),
              FabricSkeleton.card(height: 100),
            ],
          ),
        ),
      ),
    );

    // Let animation advance one frame
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(FabricSkeleton), findsNWidgets(4));
  });

  testWidgets('FabricSkeleton renders child when enabled is false', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: fabricConfig.getDarkTheme(),
        home: const Scaffold(
          body: FabricSkeleton(
            enabled: false,
            child: Text('Content Loaded'),
          ),
        ),
      ),
    );

    expect(find.text('Content Loaded'), findsOneWidget);
  });
}
