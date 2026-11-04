import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: avoid_relative_lib_imports
import '../example/lib/pages/contacts.dart';

void main() {
  testWidgets('ContactsPage renders properly with cards, base-color avatars, and search', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390 * 2.0, 844 * 2.0);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final ThemeData theme = fabricLightTheme(mainColor: fabricGrey);

    await tester.pumpWidget(
      MaterialApp(
        theme: theme,
        home: const ContactsPage(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify AppBar and Contacts page title
    expect(find.text('Contatos'), findsOneWidget);

    // Verify contacts are rendered in cards with high-contrast base initials
    expect(find.text('Ana Clara Souza'), findsOneWidget);
    expect(find.text('AC'), findsWidgets);
    expect(find.text('Staff Product Designer'), findsOneWidget);

    // Search for a contact
    await tester.enterText(find.byType(TextField).first, 'Beatriz');
    await tester.pumpAndSettle();

    expect(find.text('Beatriz Mendes'), findsOneWidget);
    expect(find.text('Ana Clara Souza'), findsNothing);

    // Clear search
    await tester.tap(find.byIcon(Icons.clear_rounded));
    await tester.pumpAndSettle();

    expect(find.text('Ana Clara Souza'), findsOneWidget);

    // Test favorite star toggle
    final Finder favoriteButtons = find.byIcon(Icons.star_rounded);
    expect(favoriteButtons, findsWidgets);

    await tester.tap(favoriteButtons.first);
    await tester.pumpAndSettle();
  });
}
