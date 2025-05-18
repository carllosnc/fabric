import 'package:flutter/material.dart';

class NeutralRadioButton extends StatefulWidget {
  const NeutralRadioButton({
    super.key,
  });

  @override
  State<NeutralRadioButton> createState() => _NeutralRadioButtonState();
}

class _NeutralRadioButtonState extends State<NeutralRadioButton> {
  int _selectedOption = 1; // Default selected option

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile(
          title: const Text('Option 1'),
          subtitle: const Text('This is a subtitle'),
          value: 1,
          groupValue: _selectedOption,
          onChanged: null,
        ),
        RadioListTile(
          title: const Text('Option 2'),
          subtitle: const Text('This is a subtitle'),
          value: 2,
          groupValue: _selectedOption,
          onChanged: (value) => setState(() => _selectedOption = value!),
        ),
        RadioListTile(
          title: const Text('Option 3'),
          subtitle: const Text('This is a subtitle'),
          value: 3,
          groupValue: _selectedOption,
          onChanged: (value) => setState(() => _selectedOption = value!),
        ),
      ],
    );
  }
}
