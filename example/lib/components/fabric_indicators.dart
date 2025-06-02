import 'package:flutter/material.dart';

class FabricIndicators extends StatelessWidget {
  const FabricIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            width: double.infinity,
            child: LinearProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
