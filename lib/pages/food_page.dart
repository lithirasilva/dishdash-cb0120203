import 'package:flutter/material.dart';
import 'package:modernlogintute/models/food.dart';


class FoodPage extends StatefulWidget {
  final Food food;
  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => FoodPageState();
}

class FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}