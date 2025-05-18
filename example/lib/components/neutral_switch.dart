import 'package:flutter/material.dart';

class NeutralSwitch extends StatefulWidget {
  const NeutralSwitch({
    super.key,
  });

  @override
  State<NeutralSwitch> createState() => _NeutralSwitchState();
}

class _NeutralSwitchState extends State<NeutralSwitch> {
  final bool _switch1Value = false;
  bool _switch2Value = false;
  bool _switch3Value = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Enable Notifications'),
          subtitle: const Text('Receive alerts and reminders'),
          value: _switch1Value,
          onChanged: null, // First switch remains disabled
        ),
        SwitchListTile(
          title: const Text('Dark Mode'),
          subtitle: const Text('Switch to dark theme'),
          value: _switch2Value,
          onChanged: (value) {
            setState(() {
              _switch2Value = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Auto Update'),
          subtitle: const Text('Keep app updated automatically'),
          value: _switch3Value,
          onChanged: (value) {
            setState(() {
              _switch3Value = value;
            });
          },
        ),
      ],
    );
  }
}
