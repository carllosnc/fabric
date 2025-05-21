import 'package:flutter/material.dart';

class NeutralNavigationBar extends StatefulWidget {
  const NeutralNavigationBar({super.key});

  @override
  State<NeutralNavigationBar> createState() => _NeutralNavigationBarState();
}

class _NeutralNavigationBarState extends State<NeutralNavigationBar> {
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
