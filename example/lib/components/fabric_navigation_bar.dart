import 'package:flutter/material.dart';

class FabricNavigationBar extends StatefulWidget {
  const FabricNavigationBar({super.key});

  @override
  State<FabricNavigationBar> createState() => _FabricNavigationBarState();
}

class _FabricNavigationBarState extends State<FabricNavigationBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('1'),
            child: Icon(Icons.notifications_none_outlined),
          ),
          selectedIcon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.messenger_outline_rounded),
          ),
          selectedIcon: Icon(Icons.messenger),
          label: 'Messages',
        ),
      ],
    );
  }
}
