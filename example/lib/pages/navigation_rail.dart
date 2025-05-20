import 'package:flutter/material.dart';

class NavigatilRailPage extends StatefulWidget {
  const NavigatilRailPage({super.key});

  @override
  State<NavigatilRailPage> createState() => _NavigatilRailPageState();
}

class _NavigatilRailPageState extends State<NavigatilRailPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                label: Text('Settings'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_outline),
                label: Text('Profile'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Center(
              child: Text('Selected index: $_selectedIndex'),
            ),
          )
        ],
      ),
    );
  }
}
