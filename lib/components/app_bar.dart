import 'package:flutter/material.dart';

class Myapp_Bar extends StatelessWidget {
  final Widget child; // Child widget to be displayed in the flexible space
  final Widget title; // Title widget for the app bar

  const Myapp_Bar({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 160, // Height when the app bar is expanded
      collapsedHeight: 60, // Height when the app bar is collapsed
      floating: false, // Determines if the app bar should float
      pinned: true, // Keeps the app bar pinned at the top when collapsed
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart), // Shopping cart icon button
          onPressed: () {
            // Handle cart button press
          },
        ),
      ],
      backgroundColor: Theme.of(context)
          .colorScheme
          .surface, // Background color of the app bar
      foregroundColor: Theme.of(context)
          .colorScheme
          .onSurface, // Color of the app bar's content
      title: const Text('DishDash'), // Title text displayed in the app bar
      centerTitle: true, // Centers the title in the app bar
      flexibleSpace: FlexibleSpaceBar(
        background: child, // Background widget for the flexible space
        centerTitle: true, // Centers the title in the flexible space
        title: title, // Title widget for the flexible space
        titlePadding: const EdgeInsets.only(
            left: 16, right: 16, bottom: 16), // Padding around the title
        collapseMode:
            CollapseMode.pin, // Pin the flexible space content when collapsed
      ),
    );
  }
}
