import 'package:flutter/material.dart';

class FabricBannerShowcase extends StatelessWidget {
  const FabricBannerShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialBanner(
        leading: const Icon(Icons.system_update_alt_outlined),
        content: const Text(
          'A new version of the Fabric Design System is ready to install.',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text('Later'),
          ),
          FilledButton(
            onPressed: () {},
            child: const Text('Update now'),
          ),
        ],
      ),
    );
  }
}
