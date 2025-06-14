//example using stepper
import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class FabricStepper extends StatefulWidget {
  const FabricStepper({super.key});

  @override
  State<FabricStepper> createState() => _FabricStepperState();
}

class _FabricStepperState extends State<FabricStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: fabricConfig.color.shade100,
      height: 200,
      child: Stepper(
        elevation: 0,
        type: StepperType.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            if (_currentStep < 2) {
              _currentStep++;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep--;
            }
          });
        },
        steps: [
          Step(
            state: _currentStep == 0 ? StepState.editing : StepState.complete,
            title: const Text('Step 1'),
            content: const Text('This is the first step.'),
          ),
          Step(
            state: _currentStep == 1 ? StepState.editing : StepState.complete,
            title: const Text('Step 2'),
            content: const Text('This is the second step.'),
          ),
          Step(
            state: _currentStep == 2 ? StepState.editing : StepState.complete,
            title: const Text('Step 3'),
            content: const Text('This is the third step.'),
          ),
        ],
      ),
    );
  }
}
