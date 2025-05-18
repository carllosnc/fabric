import 'package:flutter/material.dart';

class NeutralTimePicker extends StatefulWidget {
  const NeutralTimePicker({super.key});

  @override
  State<NeutralTimePicker> createState() => _NeutralTimePickerState();
}

class _NeutralTimePickerState extends State<NeutralTimePicker> {
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
