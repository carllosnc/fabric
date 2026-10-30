import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fabric/fabric.dart';

void main() {
  testWidgets('FabricEmptyState renders title, description, icon and action buttons', (tester) async {
    bool actionClicked = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: fabricConfig.getLightTheme(),
        home: Scaffold(
          body: FabricEmptyState(
            title: 'No projects found',
            description: 'Get started by creating your first workspace project.',
            iconData: Icons.folder_open_rounded,
            action: ElevatedButton(
              onPressed: () => actionClicked = true,
              child: const Text('Create Project'),
            ),
            secondaryAction: OutlinedButton(
              onPressed: () {},
              child: const Text('Documentation'),
            ),
          ),
        ),
      ),
    );

    expect(find.text('No projects found'), findsOneWidget);
    expect(find.text('Get started by creating your first workspace project.'), findsOneWidget);
    expect(find.byIcon(Icons.folder_open_rounded), findsOneWidget);
    expect(find.text('Create Project'), findsOneWidget);
    expect(find.text('Documentation'), findsOneWidget);

    await tester.tap(find.text('Create Project'));
    expect(actionClicked, isTrue);
  });
}
