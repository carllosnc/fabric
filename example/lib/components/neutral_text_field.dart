import 'package:flutter/material.dart';

class NeutralTextField extends StatelessWidget {
  const NeutralTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 20,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Numbers Only',
              hintText: 'Enter numbers',
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Numbers Only',
              hintText: 'Enter numbers',
              prefixIcon: Icon(Icons.edit_outlined),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.clear_outlined),
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Numbers Only',
              hintText: 'Enter numbers',
              prefixIcon: Icon(Icons.edit_outlined),
              errorText: 'This is an error message',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.clear_outlined),
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Disabled field',
              hintText: 'Disabled field',
              prefixIcon: Icon(Icons.edit_outlined),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.clear_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
