import 'package:flutter/material.dart';

import 'food.dart';
class RestaurantInfo {
  final String name;
  final String description;
  final String imageUrl;
  final double latitude;
  final double longitude;

  RestaurantInfo({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
  });
}

class Restaurant extends ChangeNotifier{
  final List<Food> _menu = [
    //burgers
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "images/food/burg1.jpg",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),

    Food(
        name: "Classic burger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "images/food/burg2.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),

    Food(
        name: "Chicken Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "images/food/burg3.jpg",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),
    Food(
        name: "Hamburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "images/food/burg4.jpg",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),






    //Salads
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),

    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),

    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),

    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),






    //Sides
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),






    //Desserts
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),

    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),







    //Drinks
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),
    Food(
        name: "Classic Cheeseburger",
        description:
            "A classic cheeseburger with melted cheddar lettuce, tomato, and pickles",
        imagePath: "assets/images/cheeseburger.png",
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avacado", price: 2.99),
        ]),  
  ];
  





//Getters
  List<Food> get menu => _menu;

//Operations

//Add to cart

//remove from cart

//get total price of cart

//get total number of items in cart

//clear cart

//Helpers

//generate a receipt

//format double value to cash

//format list of addons into a string summary
}
