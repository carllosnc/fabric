import 'package:flutter/material.dart';

class FabricMenuBar extends StatelessWidget {
  const FabricMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MenuBar(
        children: <Widget>[
          SubmenuButton(
            menuChildren: <Widget>[
              MenuItemButton(
                onPressed: () {},
                leadingIcon: const Icon(
                  Icons.create_new_folder_outlined,
                  size: 18,
                ),
                child: const Text('New'),
              ),
              MenuItemButton(
                onPressed: () {},
                leadingIcon: const Icon(
                  Icons.folder_open,
                  size: 18,
                ),
                child: const Text('Open'),
              ),
              MenuItemButton(
                onPressed: () {},
                leadingIcon: const Icon(
                  Icons.save_alt_outlined,
                  size: 18,
                ),
                child: const Text('Save'),
              ),
            ],
            child: const Text('File'),
          ),
          SubmenuButton(
            menuChildren: <Widget>[
              SubmenuButton(
                menuChildren: <Widget>[
                  MenuItemButton(
                    onPressed: () {},
                    leadingIcon: const Icon(
                      Icons.cut,
                      size: 18,
                    ),
                    child: const Text('Cut Selection'),
                  ),
                  MenuItemButton(
                    onPressed: () {},
                    leadingIcon: const Icon(
                      Icons.cut_outlined,
                      size: 18,
                    ),
                    child: const Text('Cut All'),
                  ),
                ],
                leadingIcon: const Icon(
                  Icons.cut,
                  size: 18,
                ),
                child: const Text('Cut'),
              ),
              MenuItemButton(
                onPressed: () {},
                leadingIcon: const Icon(
                  Icons.copy,
                  size: 18,
                ),
                child: const Text('Copy'),
              ),
              MenuItemButton(
                onPressed: () {},
                leadingIcon: const Icon(
                  Icons.paste,
                  size: 18,
                ),
                child: const Text('Paste'),
              ),
            ],
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
