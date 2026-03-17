import 'package:flutter/material.dart';

class FabricRadioButton extends StatefulWidget {
  const FabricRadioButton({
    super.key,
  });

  @override
  State<FabricRadioButton> createState() => _FabricRadioButtonState();
}

class _FabricRadioButtonState extends State<FabricRadioButton> {
  int _selectedOption = 1; // Default selected option

  @override
  Widget build(BuildContext context) {
    return RadioGroup<int>(
      groupValue: _selectedOption,
      onChanged: (value) => setState(() => _selectedOption = value!),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile<int>(
            title: Text('Option 1'),
            subtitle: Text('This is a subtitle'),
            value: 1,
            enabled: false,
          ),
          RadioListTile<int>(
            title: Text('Option 2'),
            subtitle: Text('This is a subtitle'),
            value: 2,
          ),
          RadioListTile<int>(
            title: Text('Option 3'),
            subtitle: Text('This is a subtitle'),
            value: 3,
          ),
        ],
      ),
    );
  }
}
