import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  final int selectedIndex; // Index of the currently selected item
  final Function(int)
      onDestinationSelected; // Callback function for item selection

  const MyNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex, // Current selected index
      onTap: onDestinationSelected, // Callback when an item is tapped
      selectedItemColor:
          Color.fromARGB(255, 235, 149, 78), // Custom color for selected item
      unselectedItemColor: Theme.of(context)
          .colorScheme
          .inverseSurface, // Color for unselected items
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home), // Home icon
          label: 'Home', // Label for accessibility
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search), // Search icon
          label: 'Search', // Label for accessibility
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications), // Notifications icon
          label: 'Notifications', // Label for accessibility
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), // Profile icon
          label: 'Profile', // Label for accessibility
        ),
      ],
    );
  }
}
