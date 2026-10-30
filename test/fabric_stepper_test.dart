import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FabricStepper', () {
    testWidgets('renders steps and advances / goes back properly', (
      WidgetTester tester,
    ) async {
      int currentStep = 0;

      await tester.pumpWidget(
        MaterialApp(
          theme: FabricTheme.light(),
          home: Scaffold(
            body: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return FabricStepper(
                  currentStep: currentStep,
                  onStepContinue: () {
                    setState(() {
                      if (currentStep < 2) {
                        currentStep++;
                      }
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      if (currentStep > 0) {
                        currentStep--;
                      }
                    });
                  },
                  steps: const <FabricStep>[
                    FabricStep(
                      title: Text('Step 1'),
                      subtitle: Text('Sub 1'),
                      content: Text('First step content'),
                    ),
                    FabricStep(
                      title: Text('Step 2'),
                      content: Text('Second step content'),
                    ),
                    FabricStep(
                      title: Text('Step 3'),
                      content: Text('Third step content'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      expect(find.text('Step 1'), findsOneWidget);
      expect(find.text('First step content'), findsOneWidget);
      expect(find.text('Continue'), findsAtLeastNWidgets(1));
      expect(find.text('Back'), findsNothing);

      await tester.tap(find.text('Continue').first);
      await tester.pumpAndSettle();

      expect(currentStep, 1);
      expect(find.text('Back'), findsAtLeastNWidgets(1));
    });

    testWidgets('supports horizontal mode inside a ListView without unbounded height error', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: FabricTheme.dark(),
          home: Scaffold(
            body: ListView(
              children: const <Widget>[
                FabricStepper(
                  type: StepperType.horizontal,
                  steps: <FabricStep>[
                    FabricStep(
                      title: Text('Account'),
                      content: Text('Account setup'),
                    ),
                    FabricStep(
                      title: Text('Done'),
                      content: Text('All set'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Account'), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
    });
  });
}
