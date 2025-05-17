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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 30,
        children: [
          Switch(
            value: _switch1Value,
            onChanged: null, // First switch remains disabled
          ),
          Switch(
            value: _switch2Value,
            onChanged: (value) {
              setState(() {
                _switch2Value = value;
              });
            },
          ),
          Switch(
            value: _switch3Value,
            onChanged: (value) {
              setState(() {
                _switch3Value = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
