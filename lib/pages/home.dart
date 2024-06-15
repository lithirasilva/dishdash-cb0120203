import 'package:flutter/material.dart';
import 'homepg.dart';
import 'notification.dart';
import 'profile.dart';
import 'search.dart';
import '../components/app_bar.dart';
import '../components/drawer.dart';
import '../components/location.dart';
import '../components/navigation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const SearchPage(),
    const NotificationsPage(), // Ensure this is imported correctly
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          const Myapp_Bar(
            title: Text(''),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Divider(
                  indent: 25,
                  endIndent: 25,
                ),
                Location(),
              ],
            ),
          ),
          SliverFillRemaining(
            child: _pages.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: MyNavBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }
}
