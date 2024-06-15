import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        restaurant.cuisine,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow),
                          const SizedBox(width: 4.0),
                          Text(
                            restaurant.rating.toString(),
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      image: DecorationImage(
                        image: AssetImage(restaurant.imageUrl),
                        fit: BoxFit.cover,
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
