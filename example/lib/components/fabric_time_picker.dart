import 'package:flutter/material.dart';

class FabricTimePicker extends StatefulWidget {
  const FabricTimePicker({super.key});

  @override
  State<FabricTimePicker> createState() => _FabricTimePickerState();
}

class _FabricTimePickerState extends State<FabricTimePicker> {
  Future<void> _selectTime() async {
    await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FilledButton(
        onPressed: _selectTime,
        child: const Text('Open Time Picker'),
      ),
    );
  }
}
