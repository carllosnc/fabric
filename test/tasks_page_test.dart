import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: avoid_relative_lib_imports
import '../example/lib/pages/tasks.dart';

void main() {
  testWidgets('TasksPage renders properly in mobile viewport without overflow', (WidgetTester tester) async {
    // Set typical mobile screen size (390 x 844 - iPhone 14 / modern Android)
    tester.view.physicalSize = const Size(390 * 2.0, 844 * 2.0);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final theme = fabricLightTheme(mainColor: fabricGrey);

    await tester.pumpWidget(
      MaterialApp(
        theme: theme,
        home: const TasksPage(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify AppBar and title
    expect(find.text('Demandas'), findsOneWidget);
    expect(find.byType(SearchBar), findsOneWidget);
    expect(find.byType(Card), findsWidgets);

    // Verify FAB-104 task
    expect(find.text('FAB-104'), findsOneWidget);
    expect(find.text('Auditar contraste dos botões secundários'), findsOneWidget);

    // Filter by searching 'TabBar'
    await tester.enterText(find.byType(SearchBar), 'TabBar');
    await tester.pumpAndSettle();

    expect(find.text('FAB-105'), findsOneWidget);
    expect(find.text('FAB-104'), findsNothing);

    // Clear search
    await tester.tap(find.byIcon(Icons.clear_rounded));
    await tester.pumpAndSettle();

    expect(find.text('FAB-104'), findsOneWidget);
  });

  testWidgets('Deleting task and tapping undo after page unmounts does not throw', (WidgetTester tester) async {
    final theme = fabricLightTheme(mainColor: fabricGrey);
    bool showPage = true;

    await tester.pumpWidget(
      MaterialApp(
        theme: theme,
        home: StatefulBuilder(
          builder: (context, setState) {
            return Scaffold(
              body: showPage ? const TasksPage() : const SizedBox(),
              floatingActionButton: ElevatedButton(
                key: const Key('unmount_button'),
                onPressed: () => setState(() => showPage = false),
                child: const Text('Unmount'),
              ),
            );
          },
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Find popup menu button on the first task card
    await tester.tap(find.byIcon(Icons.more_vert_rounded).first);
    await tester.pumpAndSettle();

    // Tap delete action
    await tester.tap(find.text('Excluir demanda'));
    await tester.pumpAndSettle();

    expect(find.text('Desfazer'), findsOneWidget);

    // Unmount TasksPage
    await tester.tap(find.byKey(const Key('unmount_button')));
    await tester.pumpAndSettle();

    expect(find.byType(TasksPage), findsNothing);
    expect(find.text('Desfazer'), findsOneWidget);

    // Tap Desfazer when TasksPage is unmounted - should not throw setState after dispose
    await tester.tap(find.text('Desfazer'));
    await tester.pumpAndSettle();
  });
}
