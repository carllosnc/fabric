import 'package:flutter/material.dart';

class FabricDialog extends StatefulWidget {
  const FabricDialog({super.key});

  @override
  State<FabricDialog> createState() => _FabricDialogState();
}

class _FabricDialogState extends State<FabricDialog> {
  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: <Widget>[
          FilledButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Dialog Title'),
                    content: const Text('This is a simple dialog content.'),
                    actions: <Widget>[
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
          FilledButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Input Dialog'),
                    content: TextField(
                      controller: _inputController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your text here',
                      ),
                    ),
                    actions: <Widget>[
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
