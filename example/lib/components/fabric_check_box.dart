import 'package:flutter/material.dart';

class FabricCheckbox extends StatefulWidget {
  const FabricCheckbox({super.key});

  @override
  State<FabricCheckbox> createState() => _FabricCheckboxState();
}

class _FabricCheckboxState extends State<FabricCheckbox> {
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          title: const Text('Enable Notifications'),
          subtitle: const Text('Receive alerts and reminders'),
          value: checkbox1,
          onChanged: null,
        ),
        CheckboxListTile(
          title: const Text('Dark Mode'),
          subtitle: const Text('Switch to dark theme'),
          value: checkbox2,
          onChanged: (value) {
            setState(() {
              checkbox2 = value ?? false;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Auto Update'),
          subtitle: const Text('Keep app updated automatically'),
          value: checkbox3,
          onChanged: (value) {
            setState(() {
              checkbox3 = value ?? false;
            });
          },
        ),
      ],
    );
  }
}
