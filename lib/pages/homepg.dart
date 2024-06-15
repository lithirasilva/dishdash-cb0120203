import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of Restaurant objects representing the restaurant data
    final List<Restaurant> restaurants = [
      Restaurant(
        name: 'Pizza Palace',
        cuisine: 'Italian',
        rating: 4.5,
        imageUrl: 'images/restaurants/pizzapalace.png',
      ),
      Restaurant(
        name: 'Burger Bistro',
        cuisine: 'American',
        rating: 4.2,
        imageUrl: 'images/restaurants/burgerbistro.jpg',
      ),
      Restaurant(
        name: 'Sushi Sushi',
        cuisine: 'Japanese',
        rating: 4.8,
        imageUrl: 'images/restaurants/sushi.jpg',
      ),
      Restaurant(
        name: 'Taco Time',
        cuisine: 'Mexican',
        rating: 4.3,
        imageUrl: 'images/restaurants/tacotime.jpg',
      ),
      Restaurant(
        name: 'Pasta Paradise',
        cuisine: 'Italian',
        rating: 4.6,
        imageUrl: 'images/restaurants/pastaParadise.png',
      ),
      Restaurant(
        name: 'Curry Corner',
        cuisine: 'Indian',
        rating: 4.7,
        imageUrl: 'images/restaurants/currycorner.jpeg',
      ),
      Restaurant(
        name: 'Salad Sensation',
        cuisine: 'Healthy',
        rating: 4.1,
        imageUrl: 'images/restaurants/saladSensation.png',
      ),
      Restaurant(
        name: 'BBQ Heaven',
        cuisine: 'American',
        rating: 4.4,
        imageUrl: 'images/restaurants/bbq.png',
      ),
      Restaurant(
        name: 'Sushi Deluxe',
        cuisine: 'Japanese',
        rating: 4.9,
        imageUrl: 'images/restaurants/sushideluxe.jpeg',
      ),
      Restaurant(
        name: 'Bakery Bliss',
        cuisine: 'Bakery',
        rating: 4.0,
        imageUrl: 'images/restaurants/bakerybliss.jpg',
      ),
      Restaurant(
        name: 'Veggie Village',
        cuisine: 'Vegetarian',
        rating: 4.2,
        imageUrl: 'images/restaurants/vegievillage.png',
      ),
      Restaurant(
        name: 'Burger Joint',
        cuisine: 'American',
        rating: 4.5,
        imageUrl: 'images/restaurants/burgerjoint.webp',
      ),
      Restaurant(
        name: 'Fish Feast',
        cuisine: 'Seafood',
        rating: 4.6,
        imageUrl: 'images/restaurants/fishfeast.jpg',
      ),
      Restaurant(
        name: 'Pho Place',
        cuisine: 'Vietnamese',
        rating: 4.3,
        imageUrl: 'images/restaurants/phoplace.jpeg',
      ),
    ];

    return Scaffold(
      // ListView.builder to create a scrollable list of restaurant items
      body: ListView.builder(
        itemCount: restaurants.length, // Number of items in the list
        itemBuilder: (context, index) {
          final restaurant =
              restaurants[index]; // Get the restaurant at the current index
          return Container(
            padding: const EdgeInsets.all(20.0), // Add padding around each item
            child: Row(
              children: [
                Expanded(
                  flex: 5, // Ratio of the space taken by this child
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align children to the start
                    children: [
                      Text(
                        restaurant.name, // Display the restaurant name
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0), // Add vertical space
                      Text(
                        restaurant.cuisine, // Display the cuisine type
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      const SizedBox(height: 8.0), // Add vertical space
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.yellow), // Star icon
                          const SizedBox(width: 4.0), // Add horizontal space
                          Text(
                            restaurant.rating.toString(), // Display the rating
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6.0), // Add horizontal space
                Expanded(
                  flex: 3, // Ratio of the space taken by this child
                  child: Container(
                    height: 100.0, // Fixed height for the image
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          100.0), // Circular border radius
                      image: DecorationImage(
                        image:
                            AssetImage(restaurant.imageUrl), // Restaurant image
                        fit: BoxFit.cover, // Cover the entire container
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Restaurant class to define the structure of restaurant data
class Restaurant {
  final String name;
  final String cuisine;
  final double rating;
  final String imageUrl;

  Restaurant({
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.imageUrl,
  });
}
