import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({
    Key? key,
  }) : super(key: key);

  // Method to open location search box dialog
  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Your Location"),
        content: TextField(
          decoration: InputDecoration(
            hintText: "Enter your location",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location label
          Text(
            "Location",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                // Address text
                Text(
                  "1234 Main Street, Sri Lanka",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Dropdown icon
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
