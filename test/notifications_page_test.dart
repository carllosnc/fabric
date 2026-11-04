import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: avoid_relative_lib_imports
import '../example/lib/pages/notifications.dart';

void main() {
  testWidgets('NotificationsPage renders tabs, cards, search, and interactions properly',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390 * 2.0, 900 * 2.0);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final ThemeData theme = fabricLightTheme(mainColor: fabricGrey);

    await tester.pumpWidget(
      MaterialApp(
        theme: theme,
        home: const NotificationsPage(),
      ),
    );
    await tester.pumpAndSettle();

    // 1. Verify AppBar and Page Title
    expect(find.text('Notificações'), findsOneWidget);
    // Unread count badge in AppBar (there are 3 unread items initially)
    expect(find.text('3'), findsOneWidget);

    // 2. Verify filter chips below search
    expect(find.widgetWithText(FilterChip, 'Todos'), findsOneWidget);
    expect(find.widgetWithText(FilterChip, 'Não lidas'), findsOneWidget);
    expect(find.widgetWithText(FilterChip, 'Segurança'), findsOneWidget);

    // 3. Verify notification items
    expect(find.text('Alerta de Segurança: Novo Acesso'), findsOneWidget);
    expect(find.text('Mariana Santos mencionou você em #design-system'), findsOneWidget);

    // 4. Test filtering by 'Não lidas' chip
    await tester.tap(find.text('Não lidas'));
    await tester.pumpAndSettle();

    // PR #89 is unread, so it should still be here
    expect(find.text('Pull Request #89 Aprovado com Sucesso'), findsOneWidget);
    // Fatura is read, so it should be filtered out
    expect(find.text('Fatura de Novembro Processada com Sucesso'), findsNothing);

    // 5. Test search query
    await tester.enterText(find.byType(TextField).first, 'Chrome');
    await tester.pumpAndSettle();

    expect(find.text('Alerta de Segurança: Novo Acesso'), findsOneWidget);
    expect(find.text('Pull Request #89 Aprovado com Sucesso'), findsNothing);

    // Clear search
    await tester.tap(find.byIcon(Icons.clear_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Pull Request #89 Aprovado com Sucesso'), findsOneWidget);

    // Switch back to 'Todos' chip
    await tester.tap(find.text('Todos'));
    await tester.pumpAndSettle();

    // 6. Test 'Marcar todas como lidas' button in AppBar
    await tester.tap(find.byIcon(Icons.done_all_rounded));
    await tester.pumpAndSettle();

    // All unread should be marked as read, unread count badge in AppBar disappears
    expect(find.text('3'), findsNothing);

    // 7. Test tapping on card to open details bottom sheet
    await tester.tap(find.text('Alerta de Segurança: Novo Acesso'));
    await tester.pumpAndSettle();

    expect(find.text('INFORMAÇÕES ADICIONAIS'), findsOneWidget);
    expect(find.textContaining('189.40.72.105'), findsOneWidget);

    // Close bottom sheet
    await tester.tap(find.text('Fechar'));
    await tester.pumpAndSettle();
  });
}
