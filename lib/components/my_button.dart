import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap; // Callback function for tap event
  final String text; // Text to display on the button

  const MyButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Assign onTap callback to GestureDetector
      child: Container(
        padding: const EdgeInsets.all(10), // Padding inside the button
        margin: const EdgeInsets.symmetric(
            horizontal: 55), // Margin around the button
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .inverseSurface, // Button background color
          borderRadius: BorderRadius.circular(10), // Button border radius
        ),
        child: Center(
          child: Text(
            text, // Button text
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface, // Text color
              fontWeight: FontWeight.bold, // Text font weight
              fontSize: 18, // Text font size
            ),
          ),
        ),
      ),
    );
  }
}
