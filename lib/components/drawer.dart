import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/settings.dart';
import 'drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // App logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.food_bank,
              size: 50,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Colors.grey.shade400,
            ),
          ),

          // Home list tile
          MyDrawerTile(
            text: 'H o m e',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // Settings list tile
          MyDrawerTile(
            text: 'S e t t i n g s',
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          const Spacer(),

          // Log out
          MyDrawerTile(
            text: 'L o g  O u t',
            icon: Icons.logout_rounded,
            onTap: () {
              // Add log out functionality here
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
