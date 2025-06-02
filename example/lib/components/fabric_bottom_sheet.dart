import 'package:flutter/material.dart';

class FabricBottomSheet extends StatelessWidget {
  const FabricBottomSheet({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.95,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FilledButton(
        onPressed: () => _showBottomSheet(context),
        child: const Text('Open Bottom Sheet'),
      ),
    );
  }
}
