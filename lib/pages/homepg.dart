import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/restaurant_detail_page.dart';

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
        address: '123 Pizza St, Italy',
        contactNumber: '+1 (234) 567-8901', // Add contact number
      ),
      Restaurant(
        name: 'Burger Bistro',
        cuisine: 'American',
        rating: 4.2,
        imageUrl: 'images/restaurants/burgerbistro.jpg',
        address: '456 Burger Ave, USA',
        contactNumber: '+1 (234) 567-8902', // Add contact number
      ),
      Restaurant(
        name: 'Sushi Sushi',
        cuisine: 'Japanese',
        rating: 4.8,
        imageUrl: 'images/restaurants/sushi.jpg',
        address: '789 Sushi Rd, Japan',
        contactNumber: '+1 (234) 567-8903', // Add contact number
      ),
      Restaurant(
        name: 'Taco Time',
        cuisine: 'Mexican',
        rating: 4.3,
        imageUrl: 'images/restaurants/tacotime.jpg',
        address: '321 Taco Blvd, Mexico',
        contactNumber: '+1 (234) 567-8904', // Add contact number
      ),
      Restaurant(
        name: 'Pasta Paradise',
        cuisine: 'Italian',
        rating: 4.6,
        imageUrl: 'images/restaurants/pastaParadise.png',
        address: '654 Pasta St, Italy',
        contactNumber: '+1 (234) 567-8905', // Add contact number
      ),
      Restaurant(
        name: 'Curry Corner',
        cuisine: 'Indian',
        rating: 4.7,
        imageUrl: 'images/restaurants/currycorner.jpeg',
        address: '987 Curry Ave, India',
        contactNumber: '+1 (234) 567-8906', // Add contact number
      ),
      Restaurant(
        name: 'Salad Sensation',
        cuisine: 'Healthy',
        rating: 4.1,
        imageUrl: 'images/restaurants/saladSensation.png',
        address: '159 Salad St, USA',
        contactNumber: '+1 (234) 567-8907', // Add contact number
      ),
      Restaurant(
        name: 'BBQ Heaven',
        cuisine: 'American',
        rating: 4.4,
        imageUrl: 'images/restaurants/bbq.png',
        address: '753 BBQ Blvd, USA',
        contactNumber: '+1 (234) 567-8908', // Add contact number
      ),
      Restaurant(
        name: 'Sushi Deluxe',
        cuisine: 'Japanese',
        rating: 4.9,
        imageUrl: 'images/restaurants/sushideluxe.jpeg',
        address: '951 Deluxe Rd, Japan',
        contactNumber: '+1 (234) 567-8909', // Add contact number
      ),
      Restaurant(
        name: 'Bakery Bliss',
        cuisine: 'Bakery',
        rating: 4.0,
        imageUrl: 'images/restaurants/bakerybliss.jpg',
        address: '357 Bakery St, USA',
        contactNumber: '+1 (234) 567-8910', // Add contact number
      ),
      Restaurant(
        name: 'Veggie Village',
        cuisine: 'Vegetarian',
        rating: 4.2,
        imageUrl: 'images/restaurants/vegievillage.png',
        address: '159 Veggie Ave, USA',
        contactNumber: '+1 (234) 567-8911', // Add contact number
      ),
      Restaurant(
        name: 'Burger Joint',
        cuisine: 'American',
        rating: 4.5,
        imageUrl: 'images/restaurants/burgerjoint.webp',
        address: '753 Joint Rd, USA',
        contactNumber: '+1 (234) 567-8912', // Add contact number
      ),
      Restaurant(
        name: 'Fish Feast',
        cuisine: 'Seafood',
        rating: 4.6,
        imageUrl: 'images/restaurants/fishfeast.jpg',
        address: '951 Fish St, USA',
        contactNumber: '+1 (234) 567-8913', // Add contact number
      ),
      Restaurant(
        name: 'Pho Place',
        cuisine: 'Vietnamese',
        rating: 4.3,
        imageUrl: 'images/restaurants/phoplace.jpeg',
        address: '357 Pho Blvd, Vietnam',
        contactNumber: '+1 (234) 567-8914', // Add contact number
      ),
    ];

    return Scaffold(
      // ListView.builder to create a scrollable list of restaurant items
      body: ListView.builder(
        itemCount: restaurants.length, // Number of items in the list
        itemBuilder: (context, index) {
          final restaurant = restaurants[index]; // Get the restaurant at the current index
          return GestureDetector(
            onTap: () {
              // Navigate to the restaurant detail page on tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantDetailPage(
                    name: restaurant.name,
                    cuisine: restaurant.cuisine,
                    rating: restaurant.rating,
                    imageUrl: restaurant.imageUrl,
                    description: 'Welcome to ${restaurant.name}, a delightful experience of ${restaurant.cuisine} cuisine!',
                    address: restaurant.address,
                    contactNumber: restaurant.contactNumber, // Pass the contact number
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20.0), // Add padding around each item
              child: Row(
                children: [
                  Expanded(
                    flex: 5, // Ratio of the space taken by this child
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
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
                            const Icon(Icons.star, color: Colors.yellow), // Star icon
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
                        borderRadius: BorderRadius.circular(100.0), // Circular border radius
                        image: DecorationImage(
                          image: AssetImage(restaurant.imageUrl), // Restaurant image
                          fit: BoxFit.cover, // Cover the entire container
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
  final String address; // Add address field
  final String contactNumber; // Add contact number field

  Restaurant({
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.imageUrl,
    required this.address, // Include in constructor
    required this.contactNumber, // Include contact number in constructor
  });
}
