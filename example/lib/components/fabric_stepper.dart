import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class FabricStepperShowcase extends StatefulWidget {
  const FabricStepperShowcase({super.key});

  @override
  State<FabricStepperShowcase> createState() => _FabricStepperShowcaseState();
}

class _FabricStepperShowcaseState extends State<FabricStepperShowcase> {
  int _currentStep = 0;
  StepperType _stepperType = StepperType.horizontal;

  static const int _totalSteps = 3;

  void _handleContinue() {
    setState(() {
      if (_currentStep < _totalSteps - 1) {
        _currentStep++;
      } else {
        _currentStep = 0;
      }
    });
  }

  void _handleCancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: SegmentedButton<StepperType>(
              segments: const <ButtonSegment<StepperType>>[
                ButtonSegment<StepperType>(
                  value: StepperType.horizontal,
                  icon: Icon(Icons.swap_horiz_outlined),
                  label: Text('Horizontal'),
                ),
                ButtonSegment<StepperType>(
                  value: StepperType.vertical,
                  icon: Icon(Icons.swap_vert_outlined),
                  label: Text('Vertical'),
                ),
              ],
              selected: <StepperType>{_stepperType},
              onSelectionChanged: (Set<StepperType> selection) {
                setState(() {
                  _stepperType = selection.first;
                });
              },
            ),
          ),
          FabricStepper(
            type: _stepperType,
            currentStep: _currentStep,
            finishLabel: 'Finish & Reset',
            onStepTapped: (int index) {
              setState(() {
                _currentStep = index;
              });
            },
            onStepContinue: _handleContinue,
            onStepCancel: _handleCancel,
            steps: <FabricStep>[
              FabricStep(
                title: const Text('Account'),
                subtitle: _stepperType == StepperType.vertical
                    ? const Text('Credentials')
                    : null,
                content: const Text(
                  'Configure your workspace name, primary email address and security preferences.',
                ),
              ),
              FabricStep(
                title: const Text('Theme'),
                subtitle: _stepperType == StepperType.vertical
                    ? const Text('Appearance')
                    : null,
                content: const Text(
                  'Select your preferred FabricSwatch palette and default Light or Dark appearance.',
                ),
              ),
              FabricStep(
                title: const Text('Review'),
                subtitle: _stepperType == StepperType.vertical
                    ? const Text('Ready to launch')
                    : null,
                content: const Text(
                  'Verify all configuration details before deploying your project environment.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
