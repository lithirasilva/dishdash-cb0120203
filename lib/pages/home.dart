import 'package:flutter/material.dart';
import 'homepg.dart'; // Import the home page
import 'notification.dart'; // Import the notifications page
import 'profile.dart'; // Import the profile page
import 'search.dart'; // Import the search page
import '../components/app_bar.dart'; // Import custom app bar component
import '../components/drawer.dart'; // Import custom drawer component
import '../components/location.dart'; // Import location component
import '../components/navigation.dart'; // Import custom navigation bar component

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variable to keep track of the currently selected index in the bottom navigation bar
  int _selectedIndex = 0;

  // List of pages to display based on the selected index
  static final List<Widget> _pages = <Widget>[
    const HomePage(), // Home page widget
    const SearchPage(), // Search page widget
    const NotificationsPage(), // Notifications page widget
    ProfilePage(), // Profile page widget
  ];

  // Method to handle changes in the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index and trigger a rebuild
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom drawer for the app
      drawer: MyDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          // Custom app bar with location information
          const Myapp_Bar(
            title: Text(''), // Empty title for the app bar
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Divider(
                  indent: 25, // Left padding for the divider
                  endIndent: 25, // Right padding for the divider
                ),
                Location(), // Location widget
              ],
            ),
          ),
          // Sliver to fill the remaining space with the selected page
          SliverFillRemaining(
            child:
                _pages.elementAt(_selectedIndex), // Display the selected page
          ),
        ],
      ),
      // Custom bottom navigation bar
      bottomNavigationBar: MyNavBar(
        selectedIndex: _selectedIndex, // Pass the selected index
        onDestinationSelected: _onItemTapped, // Handle navigation changes
      ),
    );
  }
}
