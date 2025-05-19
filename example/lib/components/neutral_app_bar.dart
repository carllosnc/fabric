import 'package:flutter/material.dart';

class NeutralAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NeutralAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: AppBar(
        title: Text('Neutral'),
        bottom: TabBar(
          tabs: [
            Tab(text: 'Home'),
            Tab(text: 'Profile'),
            Tab(text: 'Settings'),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_2_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_active_outlined)),
          PopupMenuButton(
            onSelected: (_) {},
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings_accessibility_outlined, size: 20),
                    SizedBox(width: 8),
                    Text('Settings'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.person_2_outlined, size: 20),
                    SizedBox(width: 8),
                    Text('Profile'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'help',
                child: Row(
                  children: [
                    Icon(Icons.help_center_outlined, size: 20),
                    SizedBox(width: 8),
                    Text('Help'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 20),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
