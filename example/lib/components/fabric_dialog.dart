import 'package:flutter/material.dart';

class FabricDialog extends StatelessWidget {
  const FabricDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        spacing: 5,
        children: [
          FilledButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Dialog Title'),
                    content: const Text('This is a simple dialog content.'),
                    actions: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Open Dialog'),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Input Dialog'),
                    content: TextField(
                      controller: inputController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your text here',
                      ),
                    ),
                    actions: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Open Input Dialog'),
          ),
        ],
      ),
    );
  }
}
