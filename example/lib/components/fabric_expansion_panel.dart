import 'package:flutter/material.dart';

class FabricExpansionPanel extends StatelessWidget {
  const FabricExpansionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 20),
          childrenPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          leading: Icon(Icons.featured_play_list_outlined),
          title: Text('Product Features'),
          subtitle: Text('Key features and capabilities'),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: <Widget>[
                Text('• Advanced AI Integration'),
                Text('• Real-time Analytics'),
                Text('• Cross-platform Support'),
                Text('• Cloud Synchronization'),
              ],
            ),
          ],
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 20),
          childrenPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          leading: Icon(Icons.build_outlined),
          title: Text('Technical Specifications'),
          subtitle: Text('System requirements and compatibility'),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: <Widget>[
                Text('• OS: iOS 13+ / Android 8+'),
                Text('• Memory: 2GB RAM minimum'),
                Text('• Storage: 100MB free space'),
                Text('• Internet: Required for sync'),
              ],
            ),
          ],
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 20),
          childrenPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          leading: Icon(Icons.help_outline_outlined),
          title: Text('Support Information'),
          subtitle: Text('Help and contact details'),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: <Widget>[
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
