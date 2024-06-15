import 'package:flutter/material.dart';

class Myapp_Bar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const Myapp_Bar({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 160,
      collapsedHeight: 60,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            // Handle cart button press
          },
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      title: const Text('DishDash'), // Replace with your app's title
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        centerTitle: true,
        title: title,
        titlePadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        collapseMode: CollapseMode.pin,
      ),
    );
  }
}
