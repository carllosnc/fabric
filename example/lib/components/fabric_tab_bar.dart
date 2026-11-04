import 'package:flutter/material.dart';

class FabricTabBarShowcase extends StatelessWidget {
  const FabricTabBarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.dashboard_outlined),
                  text: 'Overview',
                ),
                Tab(
                  icon: Icon(Icons.analytics_outlined),
                  text: 'Analytics',
                ),
                Tab(
                  icon: Icon(Icons.tune_outlined),
                  text: 'Settings',
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 48,
              child: TabBarView(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Overview tab content preview',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Analytics tab content preview',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Settings tab content preview',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
