import 'package:flutter/material.dart';

class NeutralCards extends StatefulWidget {
  const NeutralCards({super.key});

  @override
  State<NeutralCards> createState() => _NeutralCardsState();
}

class _NeutralCardsState extends State<NeutralCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 10,
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      'Card',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
