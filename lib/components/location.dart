import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({
    super.key,
  });
//open location menu
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
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Text(
                  "1234 Main Street, Sri Lanka",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //drop down menu
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
