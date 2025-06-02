import 'package:flutter/material.dart';

class FabricExpansionPanel extends StatelessWidget {
  const FabricExpansionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          leading: const Icon(Icons.featured_play_list_outlined),
          title: const Text('Product Features'),
          subtitle: const Text('Key features and capabilities'),
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• Advanced AI Integration'),
                Text('• Real-time Analytics'),
                Text('• Cross-platform Support'),
                Text('• Cloud Synchronization'),
              ],
            ),
          ],
        ),
        ExpansionTile(
          leading: const Icon(Icons.build_outlined),
          title: const Text('Technical Specifications'),
          subtitle: const Text('System requirements and compatibility'),
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• OS: iOS 13+ / Android 8+'),
                Text('• Memory: 2GB RAM minimum'),
                Text('• Storage: 100MB free space'),
                Text('• Internet: Required for sync'),
              ],
            ),
          ],
        ),
        ExpansionTile(
          leading: const Icon(Icons.help_outline_outlined),
          title: const Text('Support Information'),
          subtitle: const Text('Help and contact details'),
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• Email: support@example.com'),
                Text('• Phone: 1-800-123-4567'),
                Text('• Hours: 24/7 Support'),
                Text('• Response time: Within 24 hours'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
