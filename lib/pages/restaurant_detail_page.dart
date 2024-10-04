import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart'; // Import the share_plus package
import 'package:url_launcher/url_launcher.dart';
import '../components/cart_page.dart'; // Import the CartPage
import 'food.dart'; // Import your Food model
import 'package:http/http.dart' as http; // Import http package
import 'dart:convert'; // For jsonDecode
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import for LatLng

class RestaurantDetailPage extends StatefulWidget {
  final String name;
  final String cuisine;
  final double rating;
  final String imageUrl;
  final String description;
  final String address; // Added address field
  final String contactNumber; // Added contact number field

  // Add a list of food items for the restaurant based on cuisine
  final List<Food> foodItems;

  RestaurantDetailPage({
    Key? key,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.imageUrl,
    required this.description,
    required this.address, // Accept address in the constructor
    required this.contactNumber, // Accept contact number in the constructor
  }) : foodItems = _getFoodItems(cuisine), super(key: key);

  // Function to return food items based on cuisine type
  static List<Food> _getFoodItems(String cuisine) {
    switch (cuisine) {
      case 'Italian':
        return [
          Food(
            name: 'Margherita Pizza',
            price: 10.99,
            imageUrl: 'images/foods/margherita_pizza.png',
          ),
          Food(
            name: 'Pasta Primavera',
            price: 12.99,
            imageUrl: 'images/foods/pasta_primavera.png',
          ),
          Food(
            name: 'Tiramisu',
            price: 6.99,
            imageUrl: 'images/foods/tiramisu.png',
          ),
        ];
      case 'American':
        return [
          Food(
            name: 'Cheeseburger',
            price: 9.99,
            imageUrl: 'images/foods/cheeseburger.png',
          ),
          Food(
            name: 'BBQ Ribs',
            price: 14.99,
            imageUrl: 'images/foods/bbq_ribs.png',
          ),
          Food(
            name: 'Apple Pie',
            price: 5.99,
            imageUrl: 'images/foods/apple_pie.png',
          ),
        ];
      case 'Japanese':
        return [
          Food(
            name: 'Sushi Rolls',
            price: 12.99,
            imageUrl: 'images/foods/sushi_rolls.png',
          ),
          Food(
            name: 'Ramen',
            price: 10.99,
            imageUrl: 'images/foods/ramen.png',
          ),
          Food(
            name: 'Mochi',
            price: 4.99,
            imageUrl: 'images/foods/mochi.png',
          ),
        ];
      case 'Mexican':
        return [
          Food(
            name: 'Tacos',
            price: 8.99,
            imageUrl: 'images/foods/tacos.png',
          ),
          Food(
            name: 'Enchiladas',
            price: 10.99,
            imageUrl: 'images/foods/enchiladas.png',
          ),
          Food(
            name: 'Churros',
            price: 5.99,
            imageUrl: 'images/foods/churros.png',
          ),
        ];
      default:
        return [];
    }
  }

  @override
  _RestaurantDetailPageState createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  List<Food> cartItems = []; // List to hold cart items
  LatLng? restaurantLocation; // Variable to hold the restaurant's location

  @override
  void initState() {
    super.initState();
    _fetchRestaurantLocation(); // Fetch the restaurant location on init
  }

  // Function to fetch restaurant location using the OpenCage API
  Future<void> _fetchRestaurantLocation() async {
    final String apiKey = '708e9afd088e4b93acab1030dd7f468f'; // Replace with your OpenCage API key
    final String url = 'https://api.opencagedata.com/geocode/v1/json?q=${Uri.encodeComponent(widget.address)}&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['results'].isNotEmpty) {
          final lat = data['results'][0]['geometry']['lat'];
          final lng = data['results'][0]['geometry']['lng'];
          setState(() {
            restaurantLocation = LatLng(lat, lng); // Set the restaurant location
          });
        } else {
          throw Exception('No results found');
        }
      } else {
        throw Exception('Failed to load coordinates');
      }
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  // Function to show the dialog with quantity selection
  void _showQuantityDialog(BuildContext context, Food food) {
    int quantity = 1; // Default quantity

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Quantity for ${food.name}"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Price: \$${food.price.toStringAsFixed(2)}"),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                  ),
                  Text(quantity.toString(), style: const TextStyle(fontSize: 18.0)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
            ),
            ElevatedButton(
              child: const Text("Add to Cart"),
              onPressed: () {
                // Logic to add the item to the cart
                setState(() {
                  cartItems.add(food); // Add food to cart
                });
                print("Added $quantity x ${food.name} to cart.");
                Navigator.pop(context); // Close dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _viewCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartItems: cartItems), // Navigate to cart
      ),
    );
  }

  // Function to share restaurant details
  void _shareRestaurant() {
    final String message =
        'Check out ${widget.name}! \n\n${widget.description}';
    Share.share(message, subject: 'Check out this restaurant!');
  }

  // Function to open Google Maps with the restaurant location
  void _openMaps() {
    if (restaurantLocation != null) {
      final url = 'https://www.google.com/maps/search/?api=1&query=${restaurantLocation!.latitude},${restaurantLocation!.longitude}';
      launch(url); // Launch Google Maps
    } else {
      print('Location not available');
    }
  }

  // Function to contact the restaurant
  void _contactRestaurant() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: widget.contactNumber,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: _viewCart, // Navigate to cart
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _shareRestaurant, // Share restaurant details
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display restaurant image
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Restaurant details
            Text(
              widget.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.cuisine,
              style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                const SizedBox(width: 4.0),
                Text(widget.rating.toString()),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            // Button to view location
            ElevatedButton(
              onPressed: _openMaps,
              child: const Text('View Location'),
            ),
            const SizedBox(height: 16.0),
            // Button to contact the restaurant
            ElevatedButton(
              onPressed: _contactRestaurant,
              child: const Text('Contact Restaurant'),
            ),
            const SizedBox(height: 16.0),
            // Display food items
            const Text(
              'Food Items:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.foodItems.length,
                itemBuilder: (context, index) {
                  final food = widget.foodItems[index];
                  return ListTile(
                    title: Text(food.name),
                    subtitle: Text('\$${food.price.toStringAsFixed(2)}'),
                    onTap: () => _showQuantityDialog(context, food),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
