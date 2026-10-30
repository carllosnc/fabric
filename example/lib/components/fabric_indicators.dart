import 'package:flutter/material.dart';

class FabricIndicators extends StatelessWidget {
  const FabricIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Row(
            spacing: 24,
            children: <Widget>[
              SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(),
              ),
              SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(value: 0.65),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: LinearProgressIndicator(),
          ),
          SizedBox(
            width: double.infinity,
            child: LinearProgressIndicator(value: 0.65),
          ),
        ],
      ),
    );
  }
}
