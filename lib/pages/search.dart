import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Dummy data for illustration
  final List<FoodItem> _foodItems = [
    FoodItem(name: 'Pizza', description: 'Delicious cheese pizza'),
    FoodItem(name: 'Burger', description: 'Juicy beef burger'),
    FoodItem(name: 'Pasta', description: 'Creamy Alfredo pasta'),
    FoodItem(name: 'Sushi', description: 'Fresh salmon sushi'),
    FoodItem(name: 'Tacos', description: 'Spicy chicken tacos'),
    FoodItem(name: 'Steak', description: 'Grilled ribeye steak'),
    FoodItem(name: 'Salad', description: 'Fresh garden salad'),
    FoodItem(name: 'Sandwich', description: 'Classic club sandwich'),
    FoodItem(name: 'Soup', description: 'Homemade chicken soup'),
    FoodItem(name: 'Fries', description: 'Crispy french fries'),
    FoodItem(name: 'Chicken Wings', description: 'Buffalo chicken wings'),
    FoodItem(name: 'Lasagna', description: 'Traditional meat lasagna'),
    FoodItem(name: 'Burrito', description: 'Spicy bean and cheese burrito'),
    FoodItem(
        name: 'Fish and Chips', description: 'British-style fish and chips'),
    FoodItem(name: 'Caesar Salad', description: 'Classic Caesar salad'),
    FoodItem(name: 'Ramen', description: 'Authentic Japanese ramen'),
    FoodItem(name: 'Donuts', description: 'Assorted glazed donuts'),
    FoodItem(name: 'Milkshake', description: 'Chocolate milkshake'),
    FoodItem(name: 'Tiramisu', description: 'Italian dessert tiramisu'),
    FoodItem(name: 'Cupcake', description: 'Vanilla cupcake with frosting'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0), // Reduced vertical padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Looking for something to eat?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10), // Reduced spacing
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search,
                        color: Theme.of(context).colorScheme.surface),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Theme.of(context).colorScheme.secondary,
                    filled: true,
                  ),
                  onChanged: (query) {
                    setState(() {
                      _searchQuery = query.toLowerCase();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Add padding to match the search bar
              itemCount: _foodItems.length,
              itemBuilder: (context, index) {
                final item = _foodItems[index];
                if (_searchQuery.isEmpty ||
                    item.name.toLowerCase().contains(_searchQuery) ||
                    item.description.toLowerCase().contains(_searchQuery)) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.fastfood,
                            color: Theme.of(context).colorScheme.primary),
                        title: Text(item.name),
                        subtitle: Text(item.description),
                        onTap: () {
                          // Handle item tap if needed
                        },
                      ),
                      // const Divider(),  // Divider for better visuals
                    ],
                  );
                }
                return Container(); // Return an empty container if the item doesn't match the search query
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FoodItem {
  final String name;
  final String description;

  FoodItem({
    required this.name,
    required this.description,
  });
}
