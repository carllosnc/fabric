import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class FabricBannerShowcase extends StatelessWidget {
  const FabricBannerShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FabricBanner(
        icon: Icons.system_update_alt_outlined,
        title: const Text('Update available (v2.4.0)'),
        content: const Text(
          'A new version of the Fabric Design System is ready to install.',
        ),
        actions: <Widget>[
          OutlinedButton(
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
