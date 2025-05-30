import 'package:flutter/material.dart';

class NeutralBanner extends StatelessWidget {
  const NeutralBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
      leading: Icon(Icons.info_outlined),
      content: Text(
        'A neutral banner serves as a temporary message for the user, requiring some form of user acknowledgment.',
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Open',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Dismiss',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
