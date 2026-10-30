import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fabric/fabric.dart';

void main() {
  test('FabricAvatar.computeInitials generates correct initials', () {
    expect(FabricAvatar.computeInitials('John Doe'), 'JD');
    expect(FabricAvatar.computeInitials('Alice'), 'AL');
    expect(FabricAvatar.computeInitials('Carlos Alberto Santos'), 'CS');
    expect(FabricAvatar.computeInitials(''), '');
    expect(FabricAvatar.computeInitials(null), '');
  });

  testWidgets('FabricAvatar renders initials fallback and status dot', (tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: fabricConfig.getLightTheme(),
        home: Scaffold(
          body: Center(
            child: FabricAvatar(
              name: 'John Doe',
              size: FabricAvatarSize.lg,
              status: FabricAvatarStatus.online,
              onTap: () => tapped = true,
            ),
          ),
        ),
      ),
    );

    expect(find.text('JD'), findsOneWidget);

    await tester.tap(find.text('JD'));
    expect(tapped, isTrue);
  });

  testWidgets('FabricAvatarGroup renders avatars and overflow count', (tester) async {
    bool overflowTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: fabricConfig.getDarkTheme(),
        home: Scaffold(
          body: Center(
            child: FabricAvatarGroup(
              max: 2,
              onOverflowTap: () => overflowTapped = true,
              avatars: const [
                FabricAvatar(name: 'Ana Silva'),
                FabricAvatar(name: 'Bruno Costa'),
                FabricAvatar(name: 'Carlos Dias'),
                FabricAvatar(name: 'Daniel Faria'),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.text('AS'), findsOneWidget);
    expect(find.text('BC'), findsOneWidget);
    expect(find.text('+2'), findsOneWidget);

    await tester.tap(find.text('+2'));
    expect(overflowTapped, isTrue);
  });
}
