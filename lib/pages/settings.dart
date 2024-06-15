import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/Themes/themeswitch_provider.dart';
import 'package:provider/provider.dart'; // Import the provider package for state management

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"), // Title of the app bar
        backgroundColor:
            Theme.of(context).colorScheme.surface, // App bar background color
      ),
      backgroundColor:
          Theme.of(context).colorScheme.surface, // Background color of the page
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the child widget
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .primary, // Container background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              margin: const EdgeInsets.only(top: 10), // Margin at the top
              padding: const EdgeInsets.all(10), // Padding inside the container
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Space between the children
                children: [
                  // Dark mode text
                  Text(
                    "Dark Mode", // Label for dark mode switch
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .colorScheme
                          .inversePrimary, // Text color
                    ),
                  ),
                  // Dark mode switch
                  Consumer<ThemeSwitch>(
                    builder: (context, themeSwitch, child) {
                      return CupertinoSwitch(
                        value: themeSwitch
                            .isDarkMode, // Current value of the switch
                        onChanged: (value) => themeSwitch
                            .toggleTheme(), // Toggle theme on switch change
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
