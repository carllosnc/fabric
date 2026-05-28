import 'package:flutter_test/flutter_test.dart';
import 'package:fabric/fabric.dart';

void main() {
  group('FabricColors', () {
    group('fabricGrey', () {
      test('has correct value', () {
        expect(fabricGrey.toARGB32(), 0xFF0A0A0A);
      });

      test('has all 11 shade entries', () {
        expect(fabricGrey[50], isNotNull);
        expect(fabricGrey[100], isNotNull);
        expect(fabricGrey[200], isNotNull);
        expect(fabricGrey[300], isNotNull);
        expect(fabricGrey[400], isNotNull);
        expect(fabricGrey[500], isNotNull);
        expect(fabricGrey[600], isNotNull);
        expect(fabricGrey[700], isNotNull);
        expect(fabricGrey[800], isNotNull);
        expect(fabricGrey[900], isNotNull);
        expect(fabricGrey[950], isNotNull);
      });

      test('shade950 matches value', () {
        expect(fabricGrey.shade950.toARGB32(), fabricGrey.toARGB32());
      });
    });

    group('fabricBlue', () {
      test('has correct value', () {
        expect(fabricBlue.toARGB32(), 0xFF00050D);
      });

      test('has all 11 shade entries', () {
        expect(fabricBlue[50], isNotNull);
        expect(fabricBlue[950], isNotNull);
      });

      test('shade950 matches value', () {
        expect(fabricBlue.shade950.toARGB32(), fabricBlue.toARGB32());
      });
    });

    group('fabricRed', () {
      test('has correct value', () {
        expect(fabricRed.toARGB32(), 0xFF0D0000);
      });

      test('shade950 matches value', () {
        expect(fabricRed.shade950.toARGB32(), fabricRed.toARGB32());
      });
    });

    group('fabricGreen', () {
      test('has correct value', () {
        expect(fabricGreen.toARGB32(), 0xFF030D00);
      });

      test('shade950 matches value', () {
        expect(fabricGreen.shade950.toARGB32(), fabricGreen.toARGB32());
      });
    });

    group('fabricPurple', () {
      test('has correct value', () {
        expect(fabricPurple.toARGB32(), 0xFF0D000D);
      });

      test('shade950 matches value', () {
        expect(fabricPurple.shade950.toARGB32(), fabricPurple.toARGB32());
      });
    });

    group('fabricTeal', () {
      test('has correct value', () {
        expect(fabricTeal.toARGB32(), 0xFF000D0D);
      });

      test('shade950 matches value', () {
        expect(fabricTeal.shade950.toARGB32(), fabricTeal.toARGB32());
      });
    });

    group('fabricOrange', () {
      test('has correct value', () {
        expect(fabricOrange.toARGB32(), 0xFF0D0800);
      });

      test('shade950 matches value', () {
        expect(fabricOrange.shade950.toARGB32(), fabricOrange.toARGB32());
      });
    });

    group('fabricPink', () {
      test('has correct value', () {
        expect(fabricPink.toARGB32(), 0xFF0D0005);
      });

      test('shade950 matches value', () {
        expect(fabricPink.shade950.toARGB32(), fabricPink.toARGB32());
      });
    });
  });
}
