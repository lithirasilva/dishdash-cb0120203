
// Food model representing a food item
class Food {
  final String name;            // Name of the food item
  final String description;     // Description of the food item
  final String imagePath;       // Path to the food item's image
  final double price;           // Price of the food item
  final FoodCategory category;  // Category of the food item
  final List<Addon> availableAddons; // List of available addons for the food item

  // Constructor for the Food class
  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });

  // Getter for image URL
  String get imageUrl => imagePath; // Returns the image path
}

// Food categories as an enum
enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

// Food addons model
class Addon {
  final String name;    // Name of the addon
  final double price;   // Price of the addon

  // Constructor for the Addon class
  Addon({
    required this.name,
    required this.price,
  });
}
